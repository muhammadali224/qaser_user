import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import '../constant/theme.dart';
import '../function/fcm.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? initLanguages;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    myServices.sharedPref.setString("language", languageCode);
    if (languageCode == 'ar') {
      appTheme = themeArabic;
    } else {
      appTheme = themeEnglish;
    }
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestLocationPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.rawSnackbar(
          duration: const Duration(seconds: 5),
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('enableLocation'.tr),
              TextButton(
                onPressed: () {
                  // AppSettings.openLocationSettings();
                },
                child: Text(
                  'goToSetting'.tr,
                  style: TextStyle(color: AppColor.backgroundColor),
                ),
              )
            ],
          ));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
    }
  }

  @override
  void onInit() {
    requestNotificationPermissions();
    fcmConfig();
    requestLocationPermissions();
    String? sharedPrefLanguages = myServices.sharedPref.getString("language");
    if (sharedPrefLanguages == 'ar') {
      initLanguages = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLanguages == 'en') {
      initLanguages = const Locale('en');
      appTheme = themeEnglish;
    } else {
      initLanguages = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
