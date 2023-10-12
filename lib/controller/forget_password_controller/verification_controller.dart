import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/auth/forgetPassword/verify_reset_code.dart';

abstract class VerifiedController extends GetxController {
  checkCode(int verificationCode);
  resendVerify();
}

class VerifiedControllerImp extends VerifiedController {
  String? email;
  VerifyResetCodeData verifyData = VerifyResetCodeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(int verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetPassword, arguments: {
          'email': email,
        });
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

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resendVerify() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyData.resendVerify(email!);
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
}
