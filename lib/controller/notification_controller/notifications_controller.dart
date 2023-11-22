import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/services.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/notification_model/notification_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../data/source/remote/notifications_data.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<NotificationModel> data = [];
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await notificationsData.getNotifications(user.usersId!,
        "${myServices.getBox.read(GetBoxKey.isSigned) ?? false}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseDate = response['data'];
        data.addAll(responseDate.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  markRead(int notificationId) async {
    if (user.usersIsAnonymous == 0) {
      statusRequest = StatusRequest.loading;
      var response =
          await notificationsData.setNotificationsRead(notificationId);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          getData();
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    }
    update();
  }

  markAllRead() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationsData.setNotificationsRead(user.usersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getData();
      }
    }
    update();
  }

  @override
  void onInit() async {
    await Jiffy.setLocale("ar");
    getData();
    super.onInit();
  }
}
