class NotificationsModel {
  int? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  int? notificationsUserid;
  String? notificationsTime;
  int? notificationsIsRead;

  NotificationsModel(
      {this.notificationsId,
      this.notificationsTitle,
      this.notificationsBody,
      this.notificationsUserid,
      this.notificationsTime,
      this.notificationsIsRead});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsUserid = json['notifications_userid'];
    notificationsTime = json['notifications_time'];
    notificationsIsRead = json['notifications_is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['notifications_id'] = notificationsId;
    data['notifications_title'] = notificationsTitle;
    data['notifications_body'] = notificationsBody;
    data['notifications_userid'] = notificationsUserid;
    data['notifications_time'] = notificationsTime;
    data['notifications_is_read'] = notificationsIsRead;
    return data;
  }
}
