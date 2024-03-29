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
import '../../data/source/remote/user_details_data.dart';
import '../user_controller/user_controller.dart';

class UserSettingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  UserDetailsData userDetailsData = UserDetailsData(Get.find());
  TextEditingController userTextController = TextEditingController();
  File? file;

  selectImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile?.path == null) {
      showSnackBar(
        "لم تقم بإختيار صورة",
        widget: Icon(IconBroken.Image),
        color: Colors.red,
      );
    } else {
      file = File(xFile!.path);
      updateUserImage();
    }
    update();
  }

  getData() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await userDetailsData.getUserData(UserController().user.usersId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          var newUser = UserModel.fromJson(response['data']);
          UserController().user = newUser;
          update();
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error User Setting Get User Data : $e");
    }
    update();
  }

  updateUserImage() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await userDetailsData.changeUserImage(
        {
          'id': UserController().user.usersId.toString(),
          'oldFile': UserController().user.usersImage!,
        },
        file!,
      );
      print("            File            $file");
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          getData();
        } else {
          statusRequest = StatusRequest.failed;
        }
      } else {
        print(response);
      }
    } catch (e) {
      throw Exception("Error Update User Image : $e");
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
    getData();

    super.onInit();
  }
}
