// To parse this JSON data, do
//
//     final awardsModel = awardsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'awards_model.freezed.dart';
part 'awards_model.g.dart';

AwardsModel awardsModelFromJson(String str) =>
    AwardsModel.fromJson(json.decode(str));

String awardsModelToJson(AwardsModel data) => json.encode(data.toJson());

@freezed
class AwardsModel with _$AwardsModel {
  const factory AwardsModel({
    @JsonKey(name: "items_point_id") int? itemsPointId,
    @JsonKey(name: "items_point_name") String? itemsPointName,
    @JsonKey(name: "items_point_name_ar") String? itemsPointNameAr,
    @JsonKey(name: "items_point_start_date") DateTime? itemsPointStartDate,
    @JsonKey(name: "items_point_expire_date") DateTime? itemsPointExpireDate,
    @JsonKey(name: "items_point_count") int? itemsPointCount,
    @JsonKey(name: "items_point_user_replacment") int? itemsPointUserReplacment,
    @JsonKey(name: "items_point_price") int? itemsPointPrice,
    @JsonKey(name: "items_point_is_active") int? itemsPointIsActive,
    @JsonKey(name: "items_point_image") String? itemsPointImage,
  }) = _AwardsModel;

  factory AwardsModel.fromJson(Map<String, dynamic> json) =>
      _$AwardsModelFromJson(json);
}
