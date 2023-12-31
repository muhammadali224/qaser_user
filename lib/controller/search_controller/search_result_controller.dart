import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../data/model/items_model/items_model.dart';

class SearchResultController extends GetxController {
  List<ItemModel> listData = [];

  goToDetails(ItemModel itemModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "model": itemModel,
      "tag": "search",
    });
  }

  @override
  void onInit() {
    listData = Get.arguments['itemsModel'];
    super.onInit();
  }
}
