import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(updateConnectivityState);
  }

  updateConnectivityState(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: Text(
          'noConnection'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 30,
        ),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
