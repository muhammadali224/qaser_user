import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/get_box_key.dart';
import '../constant/theme.dart';
import '../services/app.service.dart';

class LocalController extends GetxController {
  Locale? initLanguages;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    myServices.getBox.write(GetBoxKey.language, languageCode);
    if (languageCode == GetBoxKey.arLanguage) {
      appTheme = themeArabic;
    } else {
      appTheme = themeEnglish;
    }
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    // requestNotificationPermissions();
    // fcmConfig();

    String? getBoxLanguages = myServices.getBox.read(GetBoxKey.language);
    if (getBoxLanguages == GetBoxKey.arLanguage) {
      initLanguages = const Locale(GetBoxKey.arLanguage);
      appTheme = themeArabic;
    } else if (getBoxLanguages == GetBoxKey.enLanguage) {
      initLanguages = const Locale(GetBoxKey.enLanguage);
      appTheme = themeEnglish;
    } else {
      initLanguages = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
