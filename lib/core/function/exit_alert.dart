import 'dart:io';

import 'package:get/get.dart';

import '../constant/color.dart';

void exitAlert(state) {
  Get.defaultDialog(
      radius: 15,
      title: 'attention'.tr,
      backgroundColor: AppColor.backgroundColor,
      middleText: 'exitAttention'.tr,
      onCancel: () {
        Get.back();
      },
      textCancel: 'cancel'.tr,
      onConfirm: () {
        exit(0);
      },
      textConfirm: 'confirm'.tr,
      buttonColor: AppColor.primaryColor);
}
