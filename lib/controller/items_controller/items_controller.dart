import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/items_data.dart';
import '../cart_controller/cart_controller.dart';
import '../user_controller/user_controller.dart';

abstract class ItemsController extends GetxController {
  initData();

  Future<void> getData(int categoriesId);

  Future<void> getSubItems();

  changeChips(int i, catVal);

  goToDetails(ItemModel itemModel);
}

class ItemsControllerImp extends ItemsController {
  late List categories;
  late int selectedCategory;
  late int id;
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<ItemModel> items = [];
  List<ItemModel> offersList = [];

  CartControllerImp cartController =
      Get.put(CartControllerImp(), permanent: true);

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  appbarBack() {
    cartController.refreshCart();
    Get.back();
    update();
  }

  goToFavorite() async {
    Get.toNamed(AppRoutes.myFavorite);
  }

  Future<void> getSubItems() async {
    // if (subItemsList.isEmpty) {
    //   var response = await itemsData.getSubItems();
    //   statusRequest = handlingData(response);
    //   if (StatusRequest.success == statusRequest) {
    //     if (response['status'] == 'success') {
    //       List responseData = response['data'];
    //       subItemsList
    //           .addAll(responseData.map((e) => SubItemsModel.fromJson(e)));
    //     } else {
    //       statusRequest = StatusRequest.failed;
    //     }
    //   }
    //   update();
    // }
  }

  initData() {
    // await userManagement.initUser();
    selectedCategory = Get.arguments['selectedCategories'];
    categories = Get.arguments['categories'];
    id = Get.arguments['id'];

    Future.wait([getSubItems(), getData(id)]);
    // getData(id);
  }

  changeChips(int i, catVal) {
    selectedCategory = i;
    getData(catVal);
    update();
  }

  getData(int categoriesId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
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
    update();
  }

  goToDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: itemsModel);
  }
}
