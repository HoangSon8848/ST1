import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:logger/logger.dart';
import 'package:apec/core/config/config.dart';
import 'package:apec/core/model/account/login.dart';
import 'package:apec/core/model/response/refresh_token.dart';
import 'package:apec/core/util/debug.dart';
import 'package:apec/core/util/util.dart';
import 'package:apec/resource/definition.dart';
import 'package:apec/route/route_path.dart';

import 'exception.dart';

class ApiRequestSender extends GetConnect {
  final Logger _logger = Logger();
  LoginModel? loginModel;
  @override
  void onInit() async {
    // httpClient.baseUrl = urlAlpha;
    httpClient.baseUrl = urlProd;
    httpClient.maxAuthRetries = 3;
  }

  Future<T?> sendRequest<T>(String requestPath, dynamic decoder,
      {dynamic params, Method method = Method.GET}) async {
    _logger.d('send request {path:$requestPath, params:$params}');
    Response<dynamic> response;
    if (loginModel == null) {
      var loginModelJson = await Utils.readData(Config.LOGIN_MODEL);
      if (loginModelJson != null) {
        loginModel = LoginModel.fromJson(loginModelJson);
      }
    }

    httpClient.addRequestModifier((Request request) async {
      if (loginModel != null) {
        request.headers['Authorization'] = 'Bearer ${loginModel!.accessToken}';
        // request.headers['msisdn'] = loginModel.phoneNumber;
      }
      return request;
    });

    if (method == Method.GET) {
      response = await get(requestPath, query: params);
    } else if (method == Method.POST) {
      response = await post(requestPath, params);
    } else {
      response = await delete(requestPath, query: params);
    }
    Debug.logMessage(
        message: '\n----------------------------------------------------\n '
            'url: ${httpClient.baseUrl}\n'
            'path: $requestPath \n'
            'response code: ${response.statusCode} \n'
            'body:${response.body}\n '
            '----------------------------------------------------\r\n');
    if (response.statusCode == 401) {
      if (requestPath.contains(apiRefreshToken)) {
        loginModel = null;
        Utils.removeData(Config.PHONE_NUMBER);
        Utils.removeData(Config.LOGIN_MODEL);
        Get.offAllNamed(RoutePaths.LOGIN_PHONE_NUMBER);
        return null;
      }
      if (await refreshToken() != null) {
        return sendRequest(requestPath, decoder,
            params: params, method: method);
      }
    }
    validateHttpStatus(response.statusCode!);
    return decoder(response.body);
  }

  void validateHttpStatus(int httpStatus) {
    switch (httpStatus) {
      case (204):
        throw NoContentException();
      case (422):
        throw InvalidValueException();
      case (404):
        throw ResourceNotFoundException();
      case (409):
        throw AlreadyActivatedPackageException();
      case (412):
        throw NotEnoughMoneyException();
      case (500):
        throw InternalServerErrorException();
    }
  }

  Future refreshToken() async {
    Function refreshTokenDecoder = (data) => RefreshToken.fromJson(data);
    try {
      RefreshToken refreshToken =
          await sendRequest('$apiRefreshToken', refreshTokenDecoder,
              params: {
                "phoneNumber": loginModel?.phoneNumber,
                "refreshToken": loginModel?.refreshToken,
                "deviceId": await Utils.deviceSerial,
              },
              method: Method.POST);
      loginModel?.accessToken = refreshToken.accessToken;
      Utils.saveData(Config.LOGIN_MODEL, loginModel);
      return refreshToken;
    } catch (e) {
      loginModel = null;
      Utils.removeData(Config.PHONE_NUMBER);
      Utils.removeData(Config.LOGIN_MODEL);
      Get.offAllNamed(RoutePaths.LOGIN_PHONE_NUMBER);
      return null;
    }
  }
}

enum Method { GET, POST, DELETE }
