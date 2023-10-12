import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/source/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  final UserPreferences userManagement = Get.find<UserPreferences>();

  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isFavorite = {};
  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  setFavorite(int id, int val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await favoriteData.addFavorite(userManagement.user.usersId!, itemsId);
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

  removeFavorite(int itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        userManagement.user.usersId!, itemsId);
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

  @override
  void onInit() async {
    await userManagement.initUser();
    super.onInit();
  }
}
