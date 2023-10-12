import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/auth/verify_data.dart';

abstract class VerifiedSignUpController extends GetxController {
  checkCode(int code);
  resendVerify();
  goToSuccessPassword();
}

class VerifiedSignUpControllerImp extends VerifiedSignUpController {
  String? email;
  VerifyData verifyData = VerifyData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(int code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyData.postData(email!, code);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.successSignUp, arguments: {
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
  goToSuccessPassword() {
    Get.offNamed(AppRoutes.successSignUp);
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
