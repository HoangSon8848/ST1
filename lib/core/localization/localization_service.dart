import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:apec/core/localization/lang/en_us.dart';
import 'package:apec/core/localization/lang/pt_mz.dart';

class LocalizationService extends Translations {
  // Supported locales
  static final locales = [Locale('pt', 'MZ'), Locale('en', 'US')];

  static const LocalizationsDelegate delegate = _AppLocalizationsDelegate();

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_MZ': ptMZ,
        'en_US': enUS,
      };
}

class _AppLocalizationsDelegate extends LocalizationsDelegate {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Bạn thêm tất cả các ngôn ngữ ứng dụng của bạn hỗ trợ tại đây
    return LocalizationService.locales.contains(locale);
  }

  @override
  Future load(Locale locale) async {
    Get.locale = locale;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
