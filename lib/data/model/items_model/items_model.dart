// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_model.freezed.dart';
part 'items_model.g.dart';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: "items_id") int? itemsId,
    @JsonKey(name: "items_name") String? itemsName,
    @JsonKey(name: "items_name_ar") String? itemsNameAr,
    @JsonKey(name: "items_desc") String? itemsDesc,
    @JsonKey(name: "items_desc_ar") String? itemsDescAr,
    @JsonKey(name: "items_image") String? itemsImage,
    @JsonKey(name: "items_group") int? itemsGroup,
    @JsonKey(name: "items_count") int? itemsCount,
    @JsonKey(name: "items_active") int? itemsActive,
    @JsonKey(name: "items_price") num? itemsPrice,
    @JsonKey(name: "items_discount") num? itemsDiscount,
    @JsonKey(name: "items_point_per_val") num? itemsPointPerVal,
    @JsonKey(name: "items_max_count") int? itemsMaxCount,
    @JsonKey(name: "items_data") DateTime? itemsData,
    @JsonKey(name: "items_cat") int? itemsCat,
    @JsonKey(name: "branch_id") int? branchId,
    @JsonKey(name: "categories_id") int? categoriesId,
    @JsonKey(name: "categories_name") String? categoriesName,
    @JsonKey(name: "categories_name_ar") String? categoriesNameAr,
    @JsonKey(name: "categories_image") String? categoriesImage,
    @JsonKey(name: "itemDiscounnt_price") num? itemDiscounntPrice,
    @JsonKey(name: "is_favorite") int? isFavorite,
    @JsonKey(name: "images") List<String>? images,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
