import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:qaser_user/data/model/sub_items_model/sub_items_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/source/remote/items_data.dart';
import '../cart_controller/cart_controller.dart';

abstract class ItemDetailsController extends GetxController {
  Future<void> initData();

  void add();

  void remove();

  void goToCart();

  Future<void> getSubItems();
}

class ItemDetailsControllerImpl extends ItemDetailsController {
  late ItemModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  RxInt itemsCount = 0.obs;
  RxBool isLoading = false.obs;
  List<SubItemModel> subItemsList = [];
  SubItemModel? selectedSubItems;

  RxDouble itemPrice = 0.0.obs;

  CartControllerImp cartController =
      Get.put(CartControllerImp(), permanent: true);

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    try {
      itemsModel = Get.arguments;
      itemsCount.value = itemsModel.itemCount!;
      await getSubItems();

      if (itemsModel.selectedSubItemsId != null) {
        selectedSubItems = subItemsList.firstWhere(
            (element) => element.subItemId == itemsModel.selectedSubItemsId!);
        itemPrice = selectedSubItems!.subItemsPrice!.toDouble().obs;
      } else {
        itemPrice = itemsModel.itemDiscounntPrice!.toDouble().obs;
      }
    } catch (e) {
      throw Exception("Error Init Item Details : $e");
    }
  }

  @override
  add() {
    if (itemsCount.value < itemsModel.itemsMaxCount!) {
      if (itemsCount.value < itemsModel.itemsCount!) {
        itemsCount.value++;
        totalPrice();
      } else {
        SmartDialog.showToast("itemCountLimit".tr);
      }
    } else {
      SmartDialog.showToast("itemMaxCountLimit".tr);
    }
  }

  remove() {
    if (itemsCount > 0) {
      itemsCount.value--;
      totalPrice();
    }
  }

  RxDouble get totalPrice {
    return (itemPrice.value * itemsCount.value).toDouble().obs;
  }

  RxDouble get totalPoint {
    if (itemsCount.value == 0)
      return (itemsModel.itemsPointPerVal! * itemPrice.value).toDouble().obs;
    else
      return (totalPrice * itemsModel.itemsPointPerVal!).toDouble().obs;
  }

  @override
  goToCart() {
    cartController.refreshCart();
    Get.toNamed(AppRoutes.cart);
  }

  @override
  Future<void> getSubItems() async {
    try {
      isLoading.toggle();
      var response = await itemsData.getSubItems(itemsModel.itemsId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List responseData = response['data'];
          subItemsList
              .addAll(responseData.map((e) => SubItemModel.fromJson(e)));
          print(subItemsList.toString());
        }
      }
      isLoading.toggle();
    } catch (e) {
      throw Exception("Error Get Sub Items : $e");
    }
    update();
  }

  setSelectedWeightAndSize(SubItemModel subItemsModel) {
    if (selectedSubItems == subItemsModel) {
      selectedSubItems = null;
      itemPrice = itemsModel.itemDiscounntPrice!.toDouble().obs;
    } else {
      selectedSubItems = subItemsModel;
      itemPrice = subItemsModel.subItemsDiscount! > 0
          ? (subItemsModel.subItemsPrice! -
                  (subItemsModel.subItemsPrice! *
                      (subItemsModel.subItemsDiscount! / 100)))
              .toDouble()
              .obs
          : subItemsModel.subItemsPrice!.toDouble().obs;
    }
    update();
  }
}
