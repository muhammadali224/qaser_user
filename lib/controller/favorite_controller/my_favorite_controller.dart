import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/fav_model/fav_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../data/source/remote/favorite_data.dart';

class MyFavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  List<FavoriteModel> data = [];
  Map isFavorite = {};
  StatusRequest statusRequest = StatusRequest.none;

  getFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getFavorite(user.usersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  deleteFavoriteItems(int itemId) {
    favoriteData.removeFavorite(user.usersId!, itemId);
    data.removeWhere((element) => element.favoriteItemId == itemId);
    update();
  }

  setFavorite(int id, int val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(user.usersId!, itemsId);
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
        getFavorite();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
  }

  removeFavorite(int itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(user.usersId!, itemsId);
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
        getFavorite();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  // goToDetails(FavoriteModel ItemsModel) {
  //   Get.toNamed(AppRoutes.itemDetails, arguments: {'itemsModel': ItemsModel});
  // }

  @override
  void onInit() async {
    getFavorite();

    super.onInit();
  }
}
