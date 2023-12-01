import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/items_data.dart';
import '../user_controller/user_controller.dart';

class OffersController extends GetxController {
  List<ItemModel> offersItems = [];
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  getOffersItems() async {
    offersItems.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getOffers(
        user.value.userFavBranchId!, user.value.usersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        offersItems.addAll(responseData.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  goToDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() async {
    getOffersItems();
    super.onInit();
  }
}
