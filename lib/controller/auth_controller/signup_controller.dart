import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/auth/signup_data.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  SignupData signupData = SignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isVisiblePassword = true;

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        userName.text.trim(),
        password.text.trim(),
        email.text.trim(),
        phone.text.trim(),
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.verificationSignup, arguments: {
            'email': email.text,
          });
        } else {
          Get.defaultDialog(
              title: 'attention'.tr,
              middleText: "emailOrPhoneUsed".tr,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('ok'.tr)),
              ]);
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    phone.dispose();
    super.dispose();
  }
}
