import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfo {
  static IosDeviceInfo? iosDeviceInfo;
  static AndroidDeviceInfo? androidDeviceInfo;

  DeviceInfo() {
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfo.iosInfo;
    } else {
      androidDeviceInfo = await deviceInfo.androidInfo;
    }
  }

  static Future<String> get deviceSerial async {
    if (Platform.isIOS) {
      iosDeviceInfo ??= await DeviceInfoPlugin().iosInfo;
      return iosDeviceInfo!.identifierForVendor;
    } else {
      androidDeviceInfo ??= await DeviceInfoPlugin().androidInfo;
      return androidDeviceInfo!.androidId;
    }
  }

  static Future<String> get systemVersion async {
    if (Platform.isIOS) {
      iosDeviceInfo ??= await DeviceInfoPlugin().iosInfo;
      return iosDeviceInfo!.systemVersion;
    } else {
      androidDeviceInfo ??= await DeviceInfoPlugin().androidInfo;
      return androidDeviceInfo!.version.baseOS!;
    }
  }

  static Future<String> get deviceName async {
    if (Platform.isIOS) {
      iosDeviceInfo ??= await DeviceInfoPlugin().iosInfo;
      return iosDeviceInfo!.name;
    } else {
      androidDeviceInfo ??= await DeviceInfoPlugin().androidInfo;
      return androidDeviceInfo!.model;
    }
  }

  static Future<String> get deviceVersion async {
    if (Platform.isIOS) {
      iosDeviceInfo ??= await DeviceInfoPlugin().iosInfo;
      return iosDeviceInfo!.systemVersion;
    } else {
      androidDeviceInfo ??= await DeviceInfoPlugin().androidInfo;
      return androidDeviceInfo!.version.release;
    }
  }
}
