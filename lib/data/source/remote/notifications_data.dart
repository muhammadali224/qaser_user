import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class NotificationsData {
  CRUD crud;

  NotificationsData(this.crud);

  getNotifications(int userId) async {
    var response =
        await crud.postData(AppLink.notifications, {'id': userId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  setNotificationsRead(int notificationId) async {
    var response = await crud.postData(AppLink.makeNotificationRead,
        {'notification_id': notificationId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  setAllNotificationsRead(int userId) async {
    var response = await crud
        .postData(AppLink.makeNotificationRead, {'user_id': userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
