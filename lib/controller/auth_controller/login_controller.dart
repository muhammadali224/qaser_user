import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/app.service.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/auth/login_data.dart';
import '../user_controller/user_controller.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToLoginWithSMS();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isVisiblePassword = true;
  Rx<UserModel> user = Get.find<UserController>().user.obs;
  UserController userController = Get.find<UserController>();
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  @override
  login() async {
    try {
      var formCurrent = formState.currentState;
      if (formCurrent!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await loginData.postData(email.text.trim(), password.text.trim());
        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            final loginUser = UserModel.fromJson(response['data']);
            userController.user = loginUser;
            if (user.value.usersApprove == 1) {
              myServices.getBox.write(GetBoxKey.step, "2");
              FirebaseMessaging.instance.unsubscribeFromTopic("notSigned");
              FirebaseMessaging.instance.subscribeToTopic("signed");
              FirebaseMessaging.instance
                  .subscribeToTopic("users${user.value.usersId}");
              await myServices.getBox.write(GetBoxKey.isSigned, true);
              Get.offAllNamed(AppRoutes.home);
            } else if (user.value.usersApprove == 0) {
              Get.toNamed(
                AppRoutes.verificationSignup,
                arguments: {
                  'email': email.text,
                },
              );
            }
          } else {
            Get.defaultDialog(
                title: 'attention'.tr,
                middleText: "emailOrPasswordError".tr,
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
    } catch (e) {
      SmartDialog.showToast(e.toString());
      print(e.toString());
    }
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToLoginWithSMS() {
    Get.toNamed(AppRoutes.loginWithSMS);
  }
}
