import 'dart:convert';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static AndroidDeviceInfo? androidDeviceInfo;

  static Future<void> saveData(String key, value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, json.encode(value));
    } catch (e, strackTrace) {
      Logger().e('Save data error:', e, strackTrace);
    }
  }

  static dynamic readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    if (value == null || value.isEmpty) {
      return null;
    } else {
      return json.decode(value);
    }
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static String secondToDateTimeString(int inputTimeInSecond) {
    final f = new DateFormat('dd/MM/yyyy HH:mm');
    var inputDate =
        new DateTime.fromMillisecondsSinceEpoch(inputTimeInSecond * 1000);
    final current = clock.now();

    final inDays = current.difference(inputDate).inDays;
    if (inDays > 7) {
      return f.format(inputDate);
    }

    if (inDays > 0) {
      return '$inDays ${"days".tr}';
    }

    final inHours = current.difference(inputDate).inHours;
    if (inHours > 0) {
      return '$inHours ${"hours".tr}';
    }

    final inMinutes = current.difference(inputDate).inMinutes;
    if (inMinutes > 0) {
      return '$inMinutes ${"minutes".tr}';
    }
    return '1 ${"minutes".tr}';
  }

  static Future<String> get deviceSerial async {
    if (Platform.isIOS) {
      final iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else {
      androidDeviceInfo ??= await DeviceInfoPlugin().androidInfo;
      return androidDeviceInfo!.androidId;
    }
  }

  static String secondToString(int inputTime, String format) {
    final f = new DateFormat(format);
    var inputDate = new DateTime.fromMillisecondsSinceEpoch(inputTime * 1000);
    return f.format(inputDate);
  }

  static String bgImageForTime() {
    var hour = DateTime.now().hour;
    if (hour < 18 && hour > 6) {
      return 'images/sunny.png';
    } else {
      return 'images/night.png';
    }
  }

  static String secondToDayOfWeek(int inputTime) {
    var inputDate = new DateTime.fromMillisecondsSinceEpoch(inputTime * 1000);
    int number = inputDate.weekday;
    if (number == 1) {
      return 'Monday'.tr;
    }
    if (number == 2) {
      return 'Tuesday'.tr;
    }
    if (number == 3) {
      return 'Wednesday'.tr;
    }
    if (number == 4) {
      return 'Thursday'.tr;
    }
    if (number == 5) {
      return 'Friday'.tr;
    }
    if (number == 6) {
      return 'Saturday'.tr;
    }
    if (number == 7) {
      return 'Sunday'.tr;
    }
    return '';
  }

  static int secondToDayOfMonth(int inputTime) {
    var inputDate = new DateTime.fromMillisecondsSinceEpoch(inputTime * 1000);
    return inputDate.day;
  }

  static String secondToMonth(int inputTime) {
    var inputDate = new DateTime.fromMillisecondsSinceEpoch(inputTime * 1000);

    int number = inputDate.month;
    if (number == 1) {
      return 'January'.tr;
    }
    if (number == 2) {
      return 'February'.tr;
    }
    if (number == 3) {
      return 'March'.tr;
    }
    if (number == 4) {
      return 'April'.tr;
    }
    if (number == 5) {
      return 'May'.tr;
    }
    if (number == 6) {
      return 'June'.tr;
    }
    if (number == 7) {
      return 'July'.tr;
    }
    if (number == 8) {
      return 'August'.tr;
    }
    if (number == 9) {
      return 'September'.tr;
    }
    if (number == 10) {
      return 'October'.tr;
    }
    if (number == 11) {
      return 'November'.tr;
    }
    if (number == 12) {
      return 'December'.tr;
    }
    return '';
  }

  static String getLocalTimeZone() {
    DateTime dateTime = DateTime.now();
    String strDateTime = dateTime.timeZoneOffset.toString();
    String timezoneFirst = strDateTime.split(':')[0];
    int test = int.parse(timezoneFirst);
    if (test < 0) {
      return timezoneFirst.substring(0, 1) +
          "0" +
          timezoneFirst.substring(1, 2) +
          ':' +
          strDateTime.split(':')[1];
    } else if (test >= 0 && test < 10) {
      return '%2B0' +
          strDateTime.split(':')[0] +
          ':' +
          strDateTime.split(':')[1];
    } else {
      return '%2B' +
          strDateTime.split(':')[0] +
          ':' +
          strDateTime.split(':')[1];
    }
  }
}
