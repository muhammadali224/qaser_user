import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/core/class/status_request.dart';
import 'package:qaser_user/data/source/remote/user_point_data/user_point_data.dart';

import '../../core/function/handling_data_controller.dart';
import '../../data/model/user_point_model/user_point_model.dart';
import '../user_controller/user_controller.dart';

class UserPointController extends GetxController {
  num totalPoint = 0;
  StatusRequest statusRequest = StatusRequest.none;
  UserPointData userPointData = UserPointData(Get.find());
  List<UserPointModel> userPointList = [];

  Future<void> getPoint() async {
    try {
      userPointList.clear();
      statusRequest = StatusRequest.loading;

      update();
      var response =
          await userPointData.getPoint(UserController().user.usersId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          totalPoint = response['total_valid_points'];
          List responseData = response['data'];
          userPointList
              .addAll(responseData.map((e) => UserPointModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error Get User Point : $e");
    }
    update();
  }

  @override
  void onInit() {
    Jiffy.setLocale("en");

    getPoint();
    super.onInit();
  }
}
