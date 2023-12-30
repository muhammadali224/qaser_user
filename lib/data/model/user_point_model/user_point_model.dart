// To parse this JSON data, do
//
//     final userPointModel = userPointModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_point_model.freezed.dart';
part 'user_point_model.g.dart';

UserPointModel userPointModelFromJson(String str) =>
    UserPointModel.fromJson(json.decode(str));

String userPointModelToJson(UserPointModel data) => json.encode(data.toJson());

@freezed
class UserPointModel with _$UserPointModel {
  const factory UserPointModel({
    @JsonKey(name: "user_point_id") int? userPointId,
    @JsonKey(name: "user_point_user_id") int? userPointUserId,
    @JsonKey(name: "points_count") num? pointsCount,
    @JsonKey(name: "point_descreption_en") String? pointDescreptionEn,
    @JsonKey(name: "point_descreption") String? pointDescreption,
    @JsonKey(name: "create_date") DateTime? createDate,
    @JsonKey(name: "expire_date") DateTime? expireDate,
    @JsonKey(name: "is_Expired") int? isExpired,
  }) = _UserPointModel;

  factory UserPointModel.fromJson(Map<String, dynamic> json) =>
      _$UserPointModelFromJson(json);
}
