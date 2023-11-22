// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: "notifications_id") int? notificationsId,
    @JsonKey(name: "notifications_title") String? notificationsTitle,
    @JsonKey(name: "notifications_body") String? notificationsBody,
    @JsonKey(name: "notifications_userid") int? notificationsUserid,
    @JsonKey(name: "notifications_time") DateTime? notificationsTime,
    @JsonKey(name: "notifications_is_read") int? notificationsIsRead,
    @JsonKey(name: "notification_level") int? notificationLevel,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
