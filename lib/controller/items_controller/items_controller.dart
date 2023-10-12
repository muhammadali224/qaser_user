import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/items_model.dart';
import '../../data/source/remote/items_data.dart';
import '../cart_controller/cart_controller.dart';

abstract class ItemsController extends GetxController {
  initData();

  getData(String categoriesId);

  getOffersItems();

  changeChips(int i, String catVal);

  goToDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends GetxController {
  late List categories;
  late int selectedCategory;
  late int id;
  late int userId;
  final UserPreferences userManagement = Get.find<UserPreferences>();

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<ItemsModel> items = [];
  List<ItemsModel> offersList = [];

  CartControllerImp cartController = Get.find();

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

  goToFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  initData() {
    // await userManagement.initUser();
    selectedCategory = Get.arguments['selectedCategories'];
    categories = Get.arguments['categories'];
    id = Get.arguments['id'];
    userId = userManagement.user.usersId!;
    getData(id);
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
      userId,
      userManagement.user.branchId!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        items.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  goToDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemsModel': itemsModel});
  }
}
