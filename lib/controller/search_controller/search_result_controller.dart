import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../data/model/items_model/items_model.dart';

class SearchResultController extends GetxController {
  List<ItemModel> listData = [];

  goToDetails(ItemModel itemModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: itemModel);
  }

  @override
  void onInit() {
    listData = Get.arguments['itemsModel'];
    super.onInit();
  }
}
