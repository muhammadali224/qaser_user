import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/source/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isVisiblePassword = true;

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
        var response = await loginData.postData(
          email.text.trim(),
          password.text.trim(),
        );
        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            if (response['data']['users_approve'] == "1") {
              await saveDataToShared(
                userId: response['data']['users_id'],
                userName: response['data']['users_name'],
                userEmail: response['data']['users_email'],
                userPhone: response['data']['users_phone'],
                userImage: response['data']['users_image'],
                favouriteBranchId: response['data']['branch_id'],
                favouriteBranchNameAr: response['data']['branch_name_ar'],
                favouriteBranchNameEn: response['data']['branch_name_en'],
              );

              myServices.sharedPref.setString('step', "2");

              FirebaseMessaging.instance.subscribeToTopic('users');
              FirebaseMessaging.instance
                  .subscribeToTopic("users${response['data']['users_id']}");
              Get.offAllNamed(AppRoutes.home);
            } else {
              Get.toNamed(AppRoutes.verificationSignup, arguments: {
                'email': email.text,
              });
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

  saveDataToShared({
    required String userId,
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userImage,
    required String favouriteBranchId,
    required String favouriteBranchNameAr,
    required String favouriteBranchNameEn,
  }) {
    myServices.sharedPref.setString('userId', userId);
    myServices.sharedPref.setString('userName', userName);
    myServices.sharedPref.setString('userEmail', userEmail);
    myServices.sharedPref.setString('userPhone', userPhone);
    myServices.sharedPref.setString('userImage', userImage);
    myServices.sharedPref.setString('favouriteBranchId', favouriteBranchId);
    myServices.sharedPref
        .setString('favouriteBranchNameAr', favouriteBranchNameAr);
    myServices.sharedPref
        .setString('favouriteBranchNameEn', favouriteBranchNameEn);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      // ignore: avoid_print
      print(token);
    });
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
}
