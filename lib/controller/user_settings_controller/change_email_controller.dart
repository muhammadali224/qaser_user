import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/user_details_data.dart';
import '../user_controller/user_controller.dart';
import 'user_setting_controller.dart';

class ChangeEmailController extends GetxController {
  UserController userController = Get.find<UserController>();
  TextEditingController userTextController = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  UserDetailsData userData = UserDetailsData(Get.find());
  UserSettingController userSettingController = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showOTP = false;

  checkCode(int code) async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      var response = await userData.verifyCode(
        userController.user.usersId!,
        userTextController.text,
        userController.user.usersEmail!,
        code,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.back();
          userSettingController.getData();
        } else {
          Get.defaultDialog(
              title: 'attention'.tr,
              middleText: "codeError".tr,
              onConfirm: () {
                Get.back();
              },
              textConfirm: 'ok'.tr);
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error User Settings Check Code : $e");
    }
    update();
  }

  resendVerify() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await userData.resendVerify(userTextController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.rawSnackbar(message: 'successResend'.tr);
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error User Settings Resend Code : $e");
    }
    update();
  }

  checkEmail() async {
    try {
      if (formKey.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await userData.checkEmail(
          userController.user.usersId!,
          userTextController.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            showOTP = true;
            update();
          } else {
            Get.defaultDialog(
              title: 'attention'.tr,
              middleText: "emailUsed".tr,
            );

            statusRequest = StatusRequest.failed;
          }
        }
        update();
      }
    } catch (e) {
      throw Exception("Error User Settings Check Email : $e");
    }
  }

  @override
  void dispose() {
    userTextController.dispose();
    super.dispose();
  }
}
