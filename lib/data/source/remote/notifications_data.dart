import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class NotificationsData {
  CRUD crud;

  NotificationsData(this.crud);

  getNotifications(String userId) async {
    var response = await crud.postData(AppLink.notifications, {'id': userId});
    return response.fold((l) => l, (r) => r);
  }

  setNotificationsRead(String notificationId) async {
    var response = await crud.postData(
        AppLink.makeNotificationRead, {'notification_id': notificationId});
    return response.fold((l) => l, (r) => r);
  }

  setAllNotificationsRead(String userId) async {
    var response =
        await crud.postData(AppLink.makeNotificationRead, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }
}
