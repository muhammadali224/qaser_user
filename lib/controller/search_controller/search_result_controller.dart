import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../data/model/items_model.dart';

class SearchResultController extends GetxController {
  List<ItemsModel> listData = [];

  goToDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() {
    listData = Get.arguments['itemsModel'];
    super.onInit();
  }
}
