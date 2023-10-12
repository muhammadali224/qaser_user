import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/services/services.dart';
import '../../core/services/user_preference.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  final UserPreferences userManagement = Get.find<UserPreferences>();

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
    userManagement.clearUser();
    myServices.sharedPref.setString('language', lang!);
    Get.offAllNamed(AppRoutes.login);
  }

  goToUserSettings() {
    Get.toNamed(AppRoutes.userSettings);
  }

  toggleSwitchVal(bool val) {
    switchVal = val;
    myServices.sharedPref.setBool('switchVal', val);
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
    myServices.sharedPref.setString('language', language);
    lang = myServices.sharedPref.getString('language')!;

    Get.back();
    update();

    Get.updateLocale(locale);
  }

  initData() async {
    final user = userManagement.user;
    userId = user.usersId!;
    userName = user.usersName!;
    switchVal = myServices.sharedPref.getBool('switchVal') ?? true;
    lang = myServices.sharedPref.getString('language') ?? "ar";
  }

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }
}
