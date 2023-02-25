import 'package:get/get.dart';
import 'package:apec/core/model/account/login.dart';
import 'package:apec/core/service/api_request_sender.dart';
import 'package:apec/core/util/util.dart';
import 'package:apec/resource/definition.dart';

class CinetopProvider extends GetxService {
  ApiRequestSender get apiService => Get.find<ApiRequestSender>();
  Function stringDecoder = (data) => String;
  Function loginDecoder = (data) => LoginModel.fromJson(data);

  Future<LoginModel> confirmOtp(String phone, String otp) async {
    return await apiService.sendRequest('$apiConfirmOtp', loginDecoder,
        params: {
          'phoneNumber': '258$phone',
          'otp': otp,
          'deviceId': await Utils.deviceSerial,
        },
        method: Method.POST);
  }
}
