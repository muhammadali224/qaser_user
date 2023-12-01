import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/services/app.service.dart';
import '../../data/model/user_model/user_model.dart';
import '../user_controller/user_controller.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  late bool switchVal;

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
    FirebaseMessaging.instance
        .unsubscribeFromTopic("users${user.value.usersId}");
    FirebaseMessaging.instance.unsubscribeFromTopic("signed");
    FirebaseMessaging.instance.subscribeToTopic("notSigned");

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
      FirebaseMessaging.instance
          .unsubscribeFromTopic("users${user.value.usersId}");
    } else {
      FirebaseMessaging.instance.subscribeToTopic("users${user.value.usersId}");
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
