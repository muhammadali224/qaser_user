import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/constant/routes.dart';
import 'package:qaser_user/core/services/app.service.dart';
import 'package:qaser_user/data/model/user_model/user_model.dart';
import 'package:qaser_user/data/source/remote/auth/check_sms_data.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../user_controller/user_controller.dart';

class SMSController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String headerTitle;
  MyServices myServices = Get.find();
  CheckSMSData checkSMSData = CheckSMSData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  UserController userController = Get.find<UserController>();

  sendSMS() async {
    if (formState.currentState!.validate()) {
      try {
        statusRequest = StatusRequest.loading;
        update();
        var response = await checkSMSData.sendSMS(
          phoneNumber.text.trim().substring(1),
        );

        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 201 || response['status'] == 200) {
            Get.toNamed(AppRoutes.verifySMS, arguments: phoneNumber.text);
          } else if (response['status'] == "failed" &&
              response['message'] == "user not found") {
            Get.defaultDialog(
              title: 'attention'.tr,
              titleStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              middleText: "userNotFound".tr,
              middleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
              onConfirm: () => Get.toNamed(AppRoutes.signUp),
              cancel: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.red, width: 1)),
                    child: Text(
                      "cancel".tr,
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              confirm: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.signUp),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.red, width: 1)),
                    child: Text(
                      "ok".tr,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
            );
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      } catch (e) {
        throw Exception("Error Send SMS 2 : $e");
      }
    }
    update();
  }

  checkSMS(int verificationCode) async {
    if (formState.currentState!.validate()) {
      try {
        statusRequest = StatusRequest.loading;
        update();
        var response = await checkSMSData.checkSMS(
            phoneNumber.text.trim().substring(1),
            verificationCode,
            userController.user.usersId.toString());

        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            if (response["user"]['status'] == "success" &&
                response["SMSVerify"]['message'] == "Verified") {
              Get.offAllNamed(AppRoutes.home);

              var loginUser = UserModel.fromJson(response["user"]["data"]);
              userController.user = loginUser;
              FirebaseMessaging.instance
                  .subscribeToTopic("${userController.user.usersId}");

              await myServices.getBox.write(GetBoxKey.isSigned, true);
            } else if (response["user"]['status'] == "failed") {}
          }
        }
      } catch (e) {
        throw Exception("Error Check SMS : $e");
      }
    }
    update();
  }

  @override
  void onInit() {
    headerTitle =
        Get.currentRoute == "/loginWithSMS" ? "loginSMS" : "confirmSMS";
    super.onInit();
  }
}
