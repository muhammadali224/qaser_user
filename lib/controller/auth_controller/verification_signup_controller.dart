import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/services/app.service.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/auth/verify_data.dart';
import '../user_controller/user_controller.dart';

abstract class VerifiedSignUpController extends GetxController {
  checkCode(String code);

  resendVerify();
}

class VerifiedSignUpControllerImp extends VerifiedSignUpController {
  String? email;
  MyServices myServices = Get.find();
  VerifyData verifyData = VerifyData(Get.find());
  Rx<UserModel> user = Get.find<UserController>().user.obs;
  UserController userController = Get.find<UserController>();
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(String code) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyData.postData(email!, code);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.home);

          var loginUser = UserModel.fromJson(response["data"]);
          userController.user = loginUser;
          FirebaseMessaging.instance
              .subscribeToTopic("user${user.value.usersId}");
          FirebaseMessaging.instance.unsubscribeFromTopic("notSigned");
          FirebaseMessaging.instance.subscribeToTopic("signed");
          await myServices.getBox.write(GetBoxKey.isSigned, true);
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
      throw Exception("Error Check Email Code : $e");
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
    try {
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
    } catch (e) {
      throw Exception("Error Resend Verify Email Code : $e");
    }
    update();
  }
}
