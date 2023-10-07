import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/my_favorite_model.dart';
import '../../data/source/remote/favorite_data.dart';

class MyFavoriteController extends GetxController {
  FavoriteData myFavoriteData = FavoriteData(Get.find());
  List data = [];
  late String userId;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  getFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getFavorite(userId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  deleteFavoriteItems(id) {
    myFavoriteData.deleteFavoriteItems(id);
    data.removeWhere((element) => element.favoriteId.toString() == id);
    update();
  }

  goToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    userId = myServices.sharedPref.getString('userId') ?? "";
    getFavorite();

    super.onInit();
  }
}
