import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/sub_items_model.dart';
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

  List<SubItemsModel> weightAndSize = [];
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

    selectedWeightAndSize = SubItemsModel(
      weightSizeId: itemsModel.itemAttrId,
      subItemValue: itemsModel.subItemValue,
      subItemName: itemsModel.subItemName,
      subItemNameAr: itemsModel.subItemNameAr,
    );

    // getSubItems();
  }

  num getPrice() {
    if (selectedWeightAndSize.weightSizeId != null) {
      return (selectedWeightAndSize.subItemValue! *
          itemsModel.itemDiscounntPrice!);
    } else {
      return itemsModel.itemDiscounntPrice!;
    }
  }

  @override
  add() {
    itemsCount.value++;
  }

  @override
  remove() {
    if (itemsCount > 0) {
      itemsCount.value--;
    }
  }

  @override
  goToCart() {
    cartController.refreshCart();
    Get.toNamed(AppRoutes.cart);
  }

  @override
  getSubItems() async {
    weightAndSize.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getSubItems(itemsModel.itemsId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['size_weight']['status'] == 'success') {
          List responseData = response['size_weight']['data'];
          weightAndSize
              .addAll(responseData.map((e) => SubItemsModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  setSelectedWeightAndSize(SubItemsModel subItemsModel) {
    selectedWeightAndSize = subItemsModel;
    update();
  }
}
