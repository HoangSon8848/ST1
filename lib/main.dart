import 'package:apec/core/localization/localization_service.dart';
import 'package:apec/route/route_path.dart';
import 'package:apec/route/router.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BaseController baseController = Get.put(BaseController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: LocalizationService.locales,
      translations: LocalizationService(),
      localizationsDelegates: [
        LocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'App_name'.tr,
      initialRoute: RoutePaths.HOME_USER,
      getPages: CinetopRouter.pages,
    );
  }
}
