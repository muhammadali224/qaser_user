import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/services/app.service.dart';
import '../../data/shared/anonymous_user.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  late bool switchVal;
  late int userId;
  late String userName;
  String? lang;

  goToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  goToFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  goToAddressView() {
    Get.toNamed(AppRoutes.addressView);
  }

  goToOrders() {
    Get.toNamed(AppRoutes.orders);
  }

  goToOrdersRating() {
    Get.toNamed(AppRoutes.ordersRating);
  }

  logout() {
    Get.deleteAll();
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    // userManagement.clearUser();
    myServices.getBox.write(GetBoxKey.language, lang!);
    Get.offAllNamed(AppRoutes.login);
  }

  goToUserSettings() {
    Get.toNamed(AppRoutes.userSettings);
  }

  toggleSwitchVal(bool val) {
    switchVal = val;
    myServices.getBox.write(GetBoxKey.switchValueNotification, val);
    update();
    if (val == false) {
      FirebaseMessaging.instance.unsubscribeFromTopic('users');
      FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    } else {
      FirebaseMessaging.instance.subscribeToTopic('users');
      FirebaseMessaging.instance.subscribeToTopic("users$userId");
    }
  }

  setLanguage(String language) {
    Locale locale = Locale(language);
    myServices.getBox.write(GetBoxKey.language, language);
    lang = myServices.getBox.read(GetBoxKey.language)!;

    Get.back();
    update();

    Get.updateLocale(locale);
  }

  initData() async {
    userId = user.usersId!;
    userName = user.usersName!;
    switchVal =
        myServices.getBox.read(GetBoxKey.switchValueNotification) ?? true;
    lang = myServices.getBox.read(GetBoxKey.language) ?? GetBoxKey.arLanguage;
  }

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }
}
