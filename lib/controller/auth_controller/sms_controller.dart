import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/constant/routes.dart';
import 'package:qaser_user/core/services/app.service.dart';
import 'package:qaser_user/data/model/user_model/user_model.dart';
import 'package:qaser_user/data/shared/anonymous_user.dart';
import 'package:qaser_user/data/source/remote/auth/check_sms_data.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

class SMSController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String headerTitle;
  MyServices myServices = Get.find();
  CheckSMSData checkSMSData = CheckSMSData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

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
            Get.toNamed(AppRoutes.verifySMS);
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      } catch (e) {
        throw Exception(e);
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
            phoneNumber.text.trim().substring(1), verificationCode);

        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            if (response["user"]['status'] == "success" &&
                response["SMSVerify"]['message'] == "Verified") {
              Get.offAllNamed(AppRoutes.home);
              ;
              user = UserModel.fromJson(response["user"]["data"]);
              await myServices.getBox
                  .write(GetBoxKey.user, userModelToJson(user));
              await myServices.getBox.write(GetBoxKey.isSigned, true);
            } else if (response["user"]['status'] == "failed") {}
          }
        }
      } catch (e) {
        throw Exception(e);
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
