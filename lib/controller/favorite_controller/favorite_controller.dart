import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/source/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isFavorite = {};
  List data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  setFavorite(String id, String val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPref.getString('userId')!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        !Get.isSnackbarOpen
            ? Get.rawSnackbar(
                message: "addFavorites".tr,
                snackStyle: SnackStyle.GROUNDED,
                icon: const Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                ),
                duration: const Duration(seconds: 2),
              )
            : null;
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
  }

  removeFavorite(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPref.getString('userId')!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        !Get.isSnackbarOpen
            ? Get.rawSnackbar(
                message: "removeFavorites".tr,
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.red,
                ),
                duration: const Duration(seconds: 2),
              )
            : null;
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
  }
}
