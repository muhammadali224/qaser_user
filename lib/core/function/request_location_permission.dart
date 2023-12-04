import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

requestLocationPermissions() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Get.rawSnackbar(
        duration: const Duration(seconds: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('enableLocation'.tr),
            TextButton(
              onPressed: () {
                // AppSettings.openLocationSettings();
              },
              child: Text(
                'goToSetting'.tr,
                style: TextStyle(color: AppColor.backgroundColor),
              ),
            )
          ],
        ));
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
  }
}
