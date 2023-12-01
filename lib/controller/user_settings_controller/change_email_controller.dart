import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/user_details_data.dart';
import '../user_controller/user_controller.dart';
import 'user_setting_controller.dart';

class ChangeEmailController extends GetxController {
  Rx<UserModel> user = Get.find<UserController>().user.obs;

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
      user.value.usersId!,
      userTextController.text,
      user.value.usersEmail!,
      code,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
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
        user.value.usersId!,
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
}
