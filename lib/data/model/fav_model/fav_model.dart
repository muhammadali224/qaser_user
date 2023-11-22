// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'fav_model.freezed.dart';
part 'fav_model.g.dart';

FavoriteModel favoriteModelFromJson(String str) =>
    FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

@freezed
class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
    @JsonKey(name: "items_id") int? itemsId,
    @JsonKey(name: "items_name") String? itemsName,
    @JsonKey(name: "items_name_ar") String? itemsNameAr,
    @JsonKey(name: "items_desc") String? itemsDesc,
    @JsonKey(name: "items_desc_ar") String? itemsDescAr,
    @JsonKey(name: "items_image") String? itemsImage,
    @JsonKey(name: "items_count") int? itemsCount,
    @JsonKey(name: "items_active") int? itemsActive,
    @JsonKey(name: "items_price") num? itemsPrice,
    @JsonKey(name: "items_discount") num? itemsDiscount,
    @JsonKey(name: "items_point_per_val") num? itemsPointPerVal,
    @JsonKey(name: "items_data") DateTime? itemsData,
    @JsonKey(name: "items_cat") int? itemsCat,
    @JsonKey(name: "branch_id") int? branchId,
    @JsonKey(name: "categories_id") int? categoriesId,
    @JsonKey(name: "categories_name") String? categoriesName,
    @JsonKey(name: "categories_name_ar") String? categoriesNameAr,
    @JsonKey(name: "categories_image") String? categoriesImage,
    @JsonKey(name: "itemDiscounnt_price") num? itemDiscounntPrice,
    @JsonKey(name: "favorite_id") int? favoriteId,
    @JsonKey(name: "favorite_userId") int? favoriteUserId,
    @JsonKey(name: "favorite_itemId") int? favoriteItemId,
    @JsonKey(name: "favorite_status") int? favoriteStatus,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
