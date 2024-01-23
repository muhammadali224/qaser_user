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
  UserController userController = Get.find<UserController>();
  late bool switchVal;

  String? lang;

  goToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  goToFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  goToUserPoint() {
    Get.toNamed(AppRoutes.userPoint);
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

  logout() async {
    try {
      FirebaseMessaging.instance
          .unsubscribeFromTopic("users${user.value.usersId}");
      FirebaseMessaging.instance.unsubscribeFromTopic("signed");
      FirebaseMessaging.instance.subscribeToTopic("notSigned");

      await myServices.getBox.remove(GetBoxKey.user);
      await myServices.getBox.write(GetBoxKey.isSigned, false);
      // await _homeControllerImp.loginAnonymous();
      await userController.clear();
      await myServices.getBox.remove(GetBoxKey.step);
      Get.offAllNamed('/');
    } catch (e) {
      throw Exception("Error Logout : $e");
    }
  }

  goToUserSettings() {
    if (user.value.usersIsAnonymous == 0) {
      Get.toNamed(AppRoutes.userSettings);
    } else if (user.value.usersIsAnonymous == 1) {
      SmartDialog.showToast("signInFirst".tr);
    }
  }

  toggleSwitchVal(bool val) {
    try {
      switchVal = val;
      myServices.getBox.write(GetBoxKey.switchValueNotification, val);
      update();
      if (val == false) {
        FirebaseMessaging.instance
            .unsubscribeFromTopic("users${user.value.usersId}");
      } else {
        FirebaseMessaging.instance
            .subscribeToTopic("users${user.value.usersId}");
      }
    } catch (e) {
      throw Exception("Error Switch Notification : $e");
    }
  }

  setLanguage(String language) {
    try {
      Locale locale = Locale(language);
      myServices.getBox.write(GetBoxKey.language, language);
      lang = myServices.getBox.read(GetBoxKey.language)!;

      Get.back();
      update();

      Get.updateLocale(locale);
    } catch (e) {
      throw Exception("Error Set Languages : $e");
    }
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
