import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/auth/forgetPassword/check_emai_datal.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(
        email.text.trim(),
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.verificationCode, arguments: {
            'email': email.text,
          });
        } else if (response['status'] == 'failed') {
          Get.defaultDialog(
              title: 'attention'.tr,
              middleText: "emailNotFound".tr,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('ok'.tr)),
              ]);
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
