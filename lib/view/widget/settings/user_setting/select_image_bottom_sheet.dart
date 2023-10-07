import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_settings_controller/user_setting_controller.dart';
import '../../../../core/constant/color.dart';

UserSettingController controller = Get.find();

showBottomSheetImagePicker() {
  Get.bottomSheet(
    Container(
      color: AppColor.backgroundColor,
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              controller.selectImage();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "fromGallery".tr,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.selectImage();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "fromCamera".tr,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
