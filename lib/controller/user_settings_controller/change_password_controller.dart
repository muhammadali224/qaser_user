import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/source/remote/user_details_data.dart';

class ChangePasswordController extends GetxController {
  final UserPreferences userManagement = Get.find<UserPreferences>();

  late TextEditingController password;
  late TextEditingController rePassword;
  late TextEditingController oldPassword;
  bool isVisiblePassword = true;
  bool isVisibleOldPassword = true;
  late int userId;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  UserDetailsData resetPasswordData = UserDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  showOldPassword() {
    isVisibleOldPassword = !isVisibleOldPassword;
    update();
  }

  resetPassword() async {
    if (formState.currentState!.validate()) {
      if (password.text == rePassword.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.changeUserPassword(
          userId,
          password.text.trim(),
          oldPassword.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.offNamed(AppRoutes.userSettings, arguments: {'userId': userId});
          } else if (response['message'] == 'the old password incorrect') {
            Get.defaultDialog(
                title: 'attention'.tr,
                middleText: "oldPasswordIncorrect".tr,
                onConfirm: () {
                  Get.back();
                },
                textConfirm: 'ok'.tr);
          } else {
            Get.defaultDialog(
                title: 'attention'.tr,
                middleText: "emailOrPhoneUsed".tr,
                onConfirm: () {
                  Get.back();
                },
                textConfirm: 'ok'.tr);
            statusRequest = StatusRequest.failed;
          }
        }
        update();
      } else {
        Get.defaultDialog(
            title: 'attention'.tr,
            middleText: "passwordDontMatch".tr,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('ok'.tr)),
            ]);
      }
    }
  }

  @override
  void onInit() async {
    await userManagement.initUser();
    password = TextEditingController();
    rePassword = TextEditingController();
    oldPassword = TextEditingController();
    userId = userManagement.user.usersId!;
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    oldPassword.dispose();
    super.dispose();
  }
}