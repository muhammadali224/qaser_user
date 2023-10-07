import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/notifications_model.dart';
import '../../data/source/remote/notifications_data.dart';

class NotificationsController extends GetxController {
  MyServices myServices = Get.find();
  NotificationsData notificationsData = NotificationsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<NotificationsModel> data = [];

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await notificationsData
        .getNotifications(myServices.sharedPref.getString('userId')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseDate = response['data'];
        data.addAll(responseDate.map((e) => NotificationsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  markRead(String notificationId) async {
    statusRequest = StatusRequest.loading;
    var response = await notificationsData.setNotificationsRead(notificationId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getData();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  markAllRead() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationsData
        .setNotificationsRead(myServices.sharedPref.getString('userId')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getData();
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
