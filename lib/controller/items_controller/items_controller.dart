import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/data/model/categories_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/items_data.dart';
import '../user_controller/user_controller.dart';

abstract class ItemsController extends GetxController {
  initData();

  Future<void> getData(int categoriesId);

  goToDetails(ItemModel itemModel);
}

class ItemsControllerImp extends ItemsController
    with GetTickerProviderStateMixin {
  late List<CategoriesModel> categories;
  late CategoriesModel selectedCategory;
  late int index;
  late TabController tabController;
  late PageController pageController;

  Rx<UserModel> user = Get.find<UserController>().user.obs;

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<ItemModel> items = [];
  List<ItemModel> offersList = [];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  goToFavorite() async {
    Get.toNamed(AppRoutes.myFavorite);
  }

  initData() async {
    try {
      selectedCategory = Get.arguments['selectedCategories'];
      categories = Get.arguments['categories'];
      index = Get.arguments['index'];

      tabController = TabController(
        vsync: this,
        length: categories.length,
        initialIndex: index,
      );

      await getData(selectedCategory.categoriesId!);
    } catch (e) {
      throw Exception("Error Init Items Controller : $e");
    }
  }

  getData(int categoriesId) async {
    try {
      items.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemsData.getData(
        categoriesId,
        user.value.usersId!,
        user.value.userFavBranchId!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List responseData = response['data'];
          items.addAll(responseData.map((e) => ItemModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error Get Items : $e");
    }
    update();
  }

  goToDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: itemsModel);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
