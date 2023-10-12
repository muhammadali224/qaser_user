import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/source/remote/user_details_data.dart';
import 'user_setting_controller.dart';

class ChangeEmailController extends GetxController {
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late int userId;

  TextEditingController userTextController = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  UserDetailsData userData = UserDetailsData(Get.find());
  UserSettingController userController = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showOTP = false;

  checkCode(int code) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await userData.verifyCode(
      userId,
      userTextController.text,
      userManagement.user.usersEmail!,
      code,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // final user = userManagement.user;
        // user.usersEmail = userTextController.text;
        // await userManagement.setUser(user);
        // myServices.sharedPref.setString('email', userTextController.text);
        Get.back();
        userController.getData();
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
    update();
  }

  resendVerify() async {
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
    update();
  }

  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await userData.checkEmail(
        userId,
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
    } else {}
  }

  @override
  void dispose() {
    userTextController.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    await userManagement.initUser();
    super.onInit();
  }
}
