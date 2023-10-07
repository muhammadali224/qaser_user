import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/auth/forgetPassword/reset_password_data.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  bool isVisiblePassword = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  @override
  resetPassword() async {
    if (formState.currentState!.validate()) {
      if (password.text == rePassword.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await resetPasswordData.postData(email!, password.text.trim());
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.offNamed(AppRoutes.successReset, arguments: {
              'email': email,
            });
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
            onConfirm: () {
              Get.back();
            },
            textConfirm: 'ok'.tr);
      }
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
