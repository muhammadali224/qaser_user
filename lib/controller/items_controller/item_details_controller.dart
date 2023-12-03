import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:qaser_user/data/shared/weight_size.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/sub_items_model/sub_items_model.dart';
import '../../data/source/remote/items_data.dart';
import '../cart_controller/cart_controller.dart';

abstract class ItemDetailsController extends GetxController {
  initData();

  add();

  remove();

  goToCart();
}

class ItemDetailsControllerImpl extends ItemDetailsController {
  late ItemModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  RxInt itemsCount = 0.obs;
  List<SubItemsModel> availableSubItems = [];
  late RxDouble itemPrice;
  SubItemsModel selectedWeightAndSize = SubItemsModel();
  CartControllerImp cartController =
      Get.put(CartControllerImp(), permanent: true);

  @override
  void onInit() {
    availableSubItems.clear();
    initData();

    super.onInit();
  }

  @override
  initData() async {
    itemsModel = Get.arguments;
    itemsCount.value = itemsModel.cartCount!;

    if (itemsModel.selectedSubItemId != null) {
      print(itemsModel.selectedSubItemId);
      selectedWeightAndSize = subItemsList
          .where(
              (element) => element.weightSizeId == itemsModel.selectedSubItemId)
          .first;
      itemPrice =
          (itemsModel.itemDiscounntPrice! * selectedWeightAndSize.subItemValue!)
              .toDouble()
              .obs;
    } else {
      selectedWeightAndSize = SubItemsModel(
        weightSizeId: itemsModel.itemAttrId,
        subItemValue: itemsModel.subItemValue,
        subItemName: itemsModel.subItemName,
        subItemNameAr: itemsModel.subItemNameAr,
      );

      itemPrice = itemsModel.itemDiscounntPrice!.toDouble().obs;
    }

    for (var item in subItemsList) {
      if (itemsModel.weighIds!.contains(item.weightSizeId.toString())) {
        availableSubItems.add(item);
      }
    }
  }

  @override
  add() {
    if (itemsCount.value < itemsModel.itemsCount!) {
      itemsCount.value++;
      totalPrice();
    } else {
      SmartDialog.showToast("itemCountLimit".tr);
    }
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

  setSelectedWeightAndSize(SubItemsModel subItemsModel) {
    selectedWeightAndSize = subItemsModel;
    itemPrice =
        (selectedWeightAndSize.subItemValue! * itemsModel.itemDiscounntPrice!)
            .toDouble()
            .obs;
    update();
  }
}
