import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/source/remote/home_data/home_data.dart';

class SearchMixController extends GetxController {
  TextEditingController search = TextEditingController();
  bool isSearch = false;
  int selectedValue = 1;
  List<ItemModel> listSearchResult = [];
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  onSearchItems() {
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
  }

  getSearchResult() async {
    statusRequest = StatusRequest.searching;
    var response = await homeData.searchItems(search.text, selectedValue);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listSearchResult.clear();
        List responseData = response['data'];
        listSearchResult.addAll(responseData.map((e) => ItemModel.fromJson(e)));
      } else {
        //statusRequest = StatusRequest.failed;
      }
    }
    goToSearchResult(listSearchResult);
    update();
  }

  goToDetails(ItemModel itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemsModel': itemsModel});
  }

  goToSearchResult(List<ItemModel> itemsModel) {
    Get.toNamed(AppRoutes.searchResult, arguments: {'itemsModel': itemsModel});
  }
}
