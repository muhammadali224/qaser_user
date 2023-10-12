import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/item_count_model.dart';
import '../../data/model/item_images_model.dart';
import '../../data/model/items_model.dart';
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
  late ItemsModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  int itemsCount = 0;
  ItemCountModel itemCountModel = ItemCountModel();
  List<SubItemsModel> weightAndSize = [];
  List<ItemImagesModel> imagesList = [];

  SubItemsModel selectedWeightAndSize = SubItemsModel();

  CartControllerImp cartController = Get.find();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    itemCountModel = await cartController.getCount(itemsModel.itemsId!);
    itemsCount = itemCountModel.countItems!;

    selectedWeightAndSize = SubItemsModel(
      weightSizeId: itemCountModel.weightSizeId,
      subItemValue: itemCountModel.subItemValue,
      subItemName: itemCountModel.subItemName,
      subItemNameAr: itemCountModel.subItemNameAr,
    );
    statusRequest = StatusRequest.none;
    getSubItems();

    update();
  }

  getPrice() {
    if (selectedWeightAndSize.weightSizeId != null) {
      return (selectedWeightAndSize.subItemValue! *
          itemsModel.itemDiscounntPrice!);
    } else {
      return itemsModel.itemDiscounntPrice;
    }
  }

  @override
  add() {
    cartController.addCart(itemsModel.itemsId!,
        selectedWeightAndSize.weightSizeId.toString(), getPrice());
    itemsCount++;
    update();
  }

  @override
  remove() {
    if (itemsCount > 0) {
      cartController.deleteFromCart(itemsModel.itemsId!);
      itemsCount--;

      update();
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
        if (response['images']['status'] == 'success') {
          List responseData = response['images']['data'];
          imagesList
              .addAll(responseData.map((e) => ItemImagesModel.fromJson(e)));
        }

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
