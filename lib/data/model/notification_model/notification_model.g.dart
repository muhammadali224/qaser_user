// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      notificationsId: json['notifications_id'] as int?,
      notificationsTitle: json['notifications_title'] as String?,
      notificationsBody: json['notifications_body'] as String?,
      notificationsUserid: json['notifications_userid'] as int?,
      notificationsTime: json['notifications_time'] == null
          ? null
          : DateTime.parse(json['notifications_time'] as String),
      notificationsIsRead: json['notifications_is_read'] as int?,
      notificationLevel: json['notification_level'] as int?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'notifications_id': instance.notificationsId,
      'notifications_title': instance.notificationsTitle,
      'notifications_body': instance.notificationsBody,
      'notifications_userid': instance.notificationsUserid,
      'notifications_time': instance.notificationsTime?.toIso8601String(),
      'notifications_is_read': instance.notificationsIsRead,
      'notification_level': instance.notificationLevel,
    };
