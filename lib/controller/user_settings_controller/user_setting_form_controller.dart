import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../core/services/user_preference.dart';
import '../../data/source/remote/user_details_data.dart';
import 'user_setting_controller.dart';

class UserSettingFormController extends GetxController {
  TextEditingController userTextController = TextEditingController();
  final UserPreferences userManagement = Get.find<UserPreferences>();

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UserDetailsData userDetailsData = UserDetailsData(Get.find());
  UserSettingController userController = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  updateUserName() async {
    var formCurrent = formKey.currentState;
    if (formCurrent!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await userDetailsData.changeUserName(
          userManagement.user.usersId!, userTextController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          myServices.sharedPref.setString('userName', userTextController.text);
          Get.back();
          userController.getData();
          update();
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  updateUserPhone() async {
    var formCurrent = formKey.currentState;
    if (formCurrent!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await userDetailsData.changeUserPhone(
          userManagement.user.usersId!, userTextController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          myServices.sharedPref.setString('userPhone', userTextController.text);
          Get.back();
          userController.getData();
          update();
        } else {
          Get.defaultDialog(
              title: 'attention'.tr,
              middleText: "phoneUsed".tr,
              onConfirm: () {
                Get.back();
              },
              textConfirm: 'ok'.tr);
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
