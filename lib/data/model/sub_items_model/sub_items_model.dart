// To parse this JSON data, do
//
//     final subItemModel = subItemModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_items_model.freezed.dart';
part 'sub_items_model.g.dart';

SubItemModel subItemModelFromJson(String str) =>
    SubItemModel.fromJson(json.decode(str));

String subItemModelToJson(SubItemModel data) => json.encode(data.toJson());

@freezed
class SubItemModel with _$SubItemModel {
  const factory SubItemModel({
    @JsonKey(name: "sub_item_id") int? subItemId,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sub_items_name") String? subItemsName,
    @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
    @JsonKey(name: "sub_items_price") num? subItemsPrice,
  }) = _SubItemModel;

  factory SubItemModel.fromJson(Map<String, dynamic> json) =>
      _$SubItemModelFromJson(json);
}
