import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/data/shared/branches.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/source/remote/home_data/home_data.dart';
import '../user_controller/user_controller.dart';

class SearchMixController extends GetxController {
  TextEditingController search = TextEditingController();
  bool isSearch = false;
  int selectedValue = 0;
  List<ItemModel> listSearchResult = [];
  StatusRequest statusRequest = StatusRequest.loading;
  HomeData homeData = HomeData(Get.find());

  onSearchItems() {
    try {
      if (search.text.isNotEmpty) {
        isSearch = true;
        getSearchResult();
        update();
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text("searchEmpty".tr),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      throw Exception("Error On Search Item : $e");
    }
  }

  getSearchResult() async {
    try {
      statusRequest = StatusRequest.searching;
      var response = await homeData.searchItems(search.text.trim(),
          selectedBranch.value.branchId!, UserController().user.usersId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          listSearchResult.clear();
          List responseData = response['data'];
          listSearchResult
              .addAll(responseData.map((e) => ItemModel.fromJson(e)));
        }
      }
      goToSearchResult(listSearchResult);
    } catch (e) {
      throw Exception("Error Get Search Items : $e");
    }
    update();
  }

  goToDetails(ItemModel itemsModel, String tag) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "model": itemsModel,
      "tag": tag,
    });
  }

  goToSearchResult(List<ItemModel> itemsModel) {
    Get.toNamed(AppRoutes.searchResult, arguments: {'itemsModel': itemsModel});
  }
}
