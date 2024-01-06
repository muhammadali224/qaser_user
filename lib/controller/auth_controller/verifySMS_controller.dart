import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/constant/routes.dart';
import 'package:qaser_user/core/services/app.service.dart';
import 'package:qaser_user/data/model/user_model/user_model.dart';
import 'package:qaser_user/data/source/remote/auth/check_sms_data.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../user_controller/user_controller.dart';

class VerifySMSController extends GetxController {
  late String phoneNumber;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String headerTitle = "confirmSMS";
  MyServices myServices = Get.find();
  CheckSMSData checkSMSData = CheckSMSData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  Rx<UserModel> user = Get.find<UserController>().user.obs;
  UserController userController = Get.find<UserController>();

  checkSMS(int verificationCode) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkSMSData.checkSMS(
          phoneNumber.trim().substring(1),
          verificationCode,
          user.value.usersId.toString());

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response["user"]['status'] == "success" &&
              response["SMSVerify"]['message'] == "Verified") {
            Get.offAllNamed(AppRoutes.home);

            var loginUser = UserModel.fromJson(response["user"]["data"]);
            userController.user = loginUser;
            FirebaseMessaging.instance
                .subscribeToTopic("user${user.value.usersId}");
            FirebaseMessaging.instance.unsubscribeFromTopic("notSigned");
            FirebaseMessaging.instance.subscribeToTopic("signed");
            await myServices.getBox.write(GetBoxKey.isSigned, true);
          }
        }
      }
    } catch (e) {
      throw Exception("Error Check SMS Code : $e");
    }

    update();
  }

  @override
  void onInit() {
    phoneNumber = Get.arguments;
    super.onInit();
  }
}
