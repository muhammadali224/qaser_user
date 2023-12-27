import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/app.service.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/user_details_data.dart';
import '../user_controller/user_controller.dart';
import 'user_setting_controller.dart';

class UserSettingFormController extends GetxController {
  TextEditingController userTextController = TextEditingController();
  Rx<UserModel> user = Get.find<UserController>().user.obs;
  UserController userController = Get.find<UserController>();

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UserDetailsData userDetailsData = UserDetailsData(Get.find());
  UserSettingController userSettingController = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  updateUserName() async {
    try {
      var formCurrent = formKey.currentState;
      if (formCurrent!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await userDetailsData.changeUserName(
            user.value.usersId!, userTextController.text);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            //myServices.sharedPref.setString('userName', userTextController.text);
            Get.back();
            userSettingController.getData();
            update();
          } else {
            statusRequest = StatusRequest.failed;
          }
        }
        update();
      }
    } catch (e) {
      throw Exception("Error User Settings Update User Name : $e");
    }
  }

  updateUserPhone() async {
    try {
      var formCurrent = formKey.currentState;
      if (formCurrent!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await userDetailsData.changeUserPhone(
            user.value.usersId!, userTextController.text);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            Get.back();
            userSettingController.getData();
            update();
          } else {
            Get.defaultDialog(
                title: 'attention'.tr,
                middleText: "phoneUsed".tr,
                onConfirm: () => Get.back(),
                textConfirm: 'ok'.tr);
            statusRequest = StatusRequest.failed;
          }
        }
        update();
      }
    } catch (e) {
      throw Exception("Error User Settings Update User Phone : $e");
    }
  }

  @override
  void dispose() {
    userTextController.dispose();

    super.dispose();
  }
}
