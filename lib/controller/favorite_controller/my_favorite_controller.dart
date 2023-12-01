import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/data/model/items_model/items_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/favorite_data.dart';
import '../user_controller/user_controller.dart';

class MyFavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  List<ItemModel> favData = [];
  Map isFavorite = {};
  StatusRequest statusRequest = StatusRequest.none;
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  getFavorite() async {
    favData.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getFavorite(user.value.usersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        favData.addAll(responseData.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  deleteFavoriteItems(int itemId) {
    favoriteData.removeFavorite(user.value.usersId!, itemId);
    favData.removeWhere((element) => element.itemsId == itemId);
    update();
  }

  setFavorite(int id, int val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(user.value.usersId!, itemsId);
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
    var response =
        await favoriteData.removeFavorite(user.value.usersId!, itemsId);
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

  goToDetails(ItemModel ItemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: ItemsModel);
  }

  @override
  void onInit() async {
    getFavorite();

    super.onInit();
  }
}
