import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model.dart';
import '../../data/source/remote/items_data.dart';

class OffersController extends GetxController {
  List<ItemsModel> offersItems = [];
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  getOffersItems() async {
    offersItems.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getOffers();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        offersItems.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
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
  void onInit() {
    getOffersItems();
    super.onInit();
  }
}
