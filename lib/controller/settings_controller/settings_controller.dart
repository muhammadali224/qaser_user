import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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
    if (user.value.usersIsAnonymous == 0) {
      Get.toNamed(AppRoutes.addressView);
    } else if (user.value.usersIsAnonymous == 1) {
      SmartDialog.showToast("signInFirst".tr);
    }
  }

  goToOrders() {
    if (user.value.usersIsAnonymous == 0) {
      Get.toNamed(AppRoutes.orders);
    } else if (user.value.usersIsAnonymous == 1) {
      SmartDialog.showToast("signInFirst".tr);
    }
  }

  goToOrdersRating() {
    if (user.value.usersIsAnonymous == 0) {
      Get.toNamed(AppRoutes.ordersRating);
    } else if (user.value.usersIsAnonymous == 1) {
      SmartDialog.showToast("signInFirst".tr);
    }
  }

  goToInfoScreen() {
    Get.toNamed(AppRoutes.infoScreen);
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
    if (user.value.usersIsAnonymous == 0) {
      Get.toNamed(AppRoutes.userSettings);
    } else if (user.value.usersIsAnonymous == 1) {
      SmartDialog.showToast("signInFirst".tr);
    }
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
