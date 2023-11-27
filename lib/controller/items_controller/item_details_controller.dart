import 'package:get/get.dart';
import 'package:qaser_user/data/shared/weight_size.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/sub_items_model/sub_items_model.dart';
import '../../data/source/remote/items_data.dart';
import '../cart_controller/cart_controller.dart';

abstract class ItemDetailsController extends GetxController {
  initData();

  add();

  remove();

  goToCart();

  getSubItems();
}

class ItemDetailsControllerImpl extends ItemDetailsController {
  late ItemModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  RxInt itemsCount = 0.obs;
  late RxDouble itemPrice;
  SubItemsModel selectedWeightAndSize = SubItemsModel();
  CartControllerImp cartController = Get.find();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    itemsModel = Get.arguments;
    itemsCount.value = itemsModel.cartCount!;
    itemPrice = itemsModel.itemDiscounntPrice!.toDouble().obs;

    selectedWeightAndSize = SubItemsModel(
      weightSizeId: itemsModel.itemAttrId,
      subItemValue: itemsModel.subItemValue,
      subItemName: itemsModel.subItemName,
      subItemNameAr: itemsModel.subItemNameAr,
    );

    getSubItems();
  }

  // num getPrice() {
  //   if (selectedWeightAndSize.weightSizeId != null) {
  //     return (selectedWeightAndSize.subItemValue! *
  //         itemsModel.itemDiscounntPrice!);
  //   } else {
  //     return itemsModel.itemDiscounntPrice!;
  //   }
  // }

  @override
  add() {
    itemsCount.value++;
    totalPrice();
  }

  @override
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
      return itemsModel.itemsPointPerVal!.toDouble().obs;
    else
      return (totalPrice * itemsModel.itemsPointPerVal!).toDouble().obs;
  }

  @override
  goToCart() {
    cartController.refreshCart();
    Get.toNamed(AppRoutes.cart);
  }

  @override
  getSubItems() async {
    if (subItemsList.isEmpty) {
      var response = await itemsData.getSubItems();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List responseData = response['data'];
          subItemsList
              .addAll(responseData.map((e) => SubItemsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    }
  }

  setSelectedWeightAndSize(SubItemsModel subItemsModel) {
    selectedWeightAndSize = subItemsModel;
    update();
  }
}
