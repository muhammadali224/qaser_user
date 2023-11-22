import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/show_snackbar.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../data/source/remote/user_details_data.dart';

class UserSettingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  UserDetailsData userDetailsData = UserDetailsData(Get.find());

  late int userId;

  TextEditingController userTextController = TextEditingController();
  File? file;

  selectImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile?.path == null) {
      showSnackBar(
        "error".tr,
        "لم تقم بإختيار صورة",
        IconBroken.Image,
        color: Colors.red,
      );
    } else {
      file = File(xFile!.path);
      updateUserImage();
    }
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userDetailsData.getUserData(userId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        user = UserModel.fromJson(response['data']);

        update();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  updateUserImage() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userDetailsData.changeUserImage(
      {
        'id': userId,
        'oldFile': user.usersImage!,
      },
      file!,
    );
    print("            File            $file");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getData();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  goToChangeUserName() {
    Get.toNamed(AppRoutes.changeUserName);
  }

  goToChangeEmail() {
    Get.toNamed(AppRoutes.changeEmail);
  }

  goToChangePhone() {
    Get.toNamed(AppRoutes.changeUserPhone);
  }

  goToChangePassword() {
    Get.toNamed(AppRoutes.changePassword);
  }

  @override
  void onInit() async {
    userId = user.usersId!;
    getData();

    super.onInit();
  }
}
