import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/source/remote/items_data.dart';
import '../user_controller/user_controller.dart';

class OffersController extends GetxController {
  List<ItemModel> offersItems = [];
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  UserController userController = Get.find<UserController>();

  getOffersItems() async {
    try {
      offersItems.clear();
      statusRequest = StatusRequest.loading;
      var response = await itemsData.getOffers(
          userController.user.userFavBranchId!, userController.user.usersId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List responseData = response['data'];
          offersItems.addAll(responseData.map((e) => ItemModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error Get Offers : $e");
    }
    update();
  }

  goToDetails(ItemModel itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "model": itemsModel,
      "tag": "offers",
    });
  }

  @override
  void onInit() async {
    getOffersItems();
    super.onInit();
  }
}
