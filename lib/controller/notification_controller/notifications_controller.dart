import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/app.service.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/notification_model/notification_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/notifications_data.dart';
import '../user_controller/user_controller.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<NotificationModel> data = [];
  MyServices myServices = Get.find();
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  getData() async {
    try {
      data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationsData.getNotifications(
          user.value.usersId!,
          "${myServices.getBox.read(GetBoxKey.isSigned) ?? "false"}");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List responseDate = response['data'];
          data.addAll(responseDate.map((e) => NotificationModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error Get Notification : $e");
    }
    update();
  }

  markRead(int notificationId) async {
    try {
      if (user.value.usersIsAnonymous == 0) {
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
    } catch (e) {
      throw Exception("Error Mark Notification Read  : $e");
    }
    update();
  }

  markAllRead() async {
    statusRequest = StatusRequest.loading;
    var response =
        await notificationsData.setNotificationsRead(user.value.usersId!);
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
