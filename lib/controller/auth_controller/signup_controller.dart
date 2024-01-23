import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/auth/check_sms_data.dart';
import '../../data/source/remote/auth/signup_data.dart';
import '../user_controller/user_controller.dart';

abstract class SignUpController extends GetxController {
  Future<void> signUp();

  Future<void> signUpWithPhone();

  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  UserController userController = Get.find<UserController>();
  SignupData signupData = SignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isVisiblePassword = true;
  CheckSMSData checkSMSData = CheckSMSData(Get.find());

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  @override
  signUp() async {
    try {
      if (formState.currentState!.validate()) {
        SmartDialog.showLoading(msg: "loading".tr);
        var response = await signupData.postData(
          userName.text.trim(),
          password.text.trim(),
          email.text.trim(),
          phone.text.trim(),
          userController.user.usersId.toString(),
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.offNamed(AppRoutes.verificationSignup, arguments: {
              'email': email.text,
            });
          } else {
            SmartDialog.showNotify(
              msg: "emailOrPhoneUsed".tr,
              notifyType: NotifyType.warning,
            );

            statusRequest = StatusRequest.failed;
          }
        }
      }
    } catch (e) {
      throw Exception("Error SignUp : $e");
    }
    update();
    SmartDialog.dismiss();
  }

  @override
  Future<void> signUpWithPhone() async {
    try {
      if (formState.currentState!.validate()) {
        SmartDialog.showLoading(msg: "loading".tr);
        var response = await signupData.postData(
          userName.text.trim(),
          password.text.trim(),
          email.text.trim().toLowerCase(),
          phone.text.trim(),
          userController.user.usersId.toString(),
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            sendSMS();
          } else {
            SmartDialog.showNotify(
              msg: "emailOrPhoneUsed".tr,
              notifyType: NotifyType.alert,
            );

            statusRequest = StatusRequest.failed;
          }
        }
        update();
      }
      SmartDialog.dismiss();
    } catch (e) {
      throw Exception("Error Sing Up With Phone : $e");
    }
  }

  sendSMS() async {
    try {
      SmartDialog.showLoading(msg: "loading".tr);
      var response = await checkSMSData.sendSMS(
        phone.text.trim().substring(1),
      );

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 201 || response['status'] == 200) {
          Get.toNamed(AppRoutes.verifySMS, arguments: phone.text.trim());
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception("Error Send SMS : $e");
    }

    update();
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
