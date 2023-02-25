import 'dart:async';

import 'package:connectivity/connectivity.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:apec/core/service/api_request_sender.dart';
import 'package:apec/resource/definition.dart';

class BaseController extends GetxController {
  ApiRequestSender a = Get.put(ApiRequestSender());
  final Logger _logger = Logger();

  // bool isConnectInternet = true;
  String? connectionStatus;
  var isLoading = true.obs;
  String errorMessage = "";
  StreamSubscription<ConnectivityResult>? connectionListener;
  final Connectivity _connectivity = Connectivity();
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  // Future<void> setCurrentScreen({@required String screenName}) async {
  //   await analytics.setCurrentScreen(
  //     screenName: screenName,
  //     screenClassOverride: screenName,
  //   );
  // }

  @override
  void onInit() {
    super.onInit();
    connectionListener = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) => _updateConnectionStatus(result));
  }

  @override
  void dispose() {
    super.dispose();
    connectionListener!.cancel();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus = result.toString();
        isConnectInternet = true;
        isInternet3G = false;
        break;
      case ConnectivityResult.mobile:
        connectionStatus = result.toString();
        isConnectInternet = true;
        isInternet3G = true;
        break;
      case ConnectivityResult.none:
        connectionStatus = result.toString();
        isConnectInternet = false;
        isInternet3G = false;
        break;
      default:
        connectionStatus = 'Failed to get connectivity.';
        break;
    }
  }

  //todo: find a way to use strong type instead of dynamic
  Future loadData(dynamic params) async {
    resetToDefaultValue();
    if (!isConnectInternet) {
      errorMessage = "msg_no_internet";
    } else {
      try {
        await callApiAndParseResponse(params);
      } catch (e, stackTrace) {
        _logger.e("An error occurred when calling api", e, stackTrace);
        errorMessage = "system_is_updating";
      }
    }
    isLoading(false);
  }

  callApiAndParseResponse(dynamic params) {}

  @mustCallSuper
  void resetToDefaultValue() {
    isLoading = true.obs;
    errorMessage = "";
  }
}
