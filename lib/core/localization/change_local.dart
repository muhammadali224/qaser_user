import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import '../constant/get_box_key.dart';
import '../constant/theme.dart';
import '../function/fcm.dart';
import '../services/services.dart';

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
