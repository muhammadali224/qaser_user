import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/user_details_data.dart';
import '../user_controller/user_controller.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController rePassword;
  late TextEditingController oldPassword;
  bool isVisiblePassword = true;
  bool isVisibleOldPassword = true;
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
    try {
      if (formState.currentState!.validate()) {
        if (password.text == rePassword.text) {
          statusRequest = StatusRequest.loading;
          update();
          var response = await resetPasswordData.changeUserPassword(
            UserController().user.usersId!,
            password.text.trim(),
            oldPassword.text,
          );
          statusRequest = handlingData(response);
          if (StatusRequest.success == statusRequest) {
            if (response['status'] == 'success') {
              Get.offNamed(AppRoutes.userSettings,
                  arguments: {'userId': UserController().user.usersId!});
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
    } catch (e) {
      throw Exception("Error User Settings Reset Password : $e");
    }
  }

  @override
  void onInit() async {
    password = TextEditingController();
    rePassword = TextEditingController();
    oldPassword = TextEditingController();

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
