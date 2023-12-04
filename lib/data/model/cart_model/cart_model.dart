// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: "cart_id") int? cartId,
    @JsonKey(name: "cart_userid") int? cartUserid,
    @JsonKey(name: "cart_itemid") int? cartItemid,
    @JsonKey(name: "cart_item_note") String? cartItemNote,
    @JsonKey(name: "cart_orders") int? cartOrders,
    @JsonKey(name: "cart_size_weight_id") int? cartSizeWeightId,
    @JsonKey(name: "cart_item_price") num? cartItemPrice,
    @JsonKey(name: "cart_branch_id") int? cartBranchId,
    @JsonKey(name: "Item_point_count") num? cartItemPoint,
    @JsonKey(name: "cart_item_count") int? cartItemCount,
    @JsonKey(name: "items_id") int? itemsId,
    @JsonKey(name: "items_name") String? itemsName,
    @JsonKey(name: "items_name_ar") String? itemsNameAr,
    @JsonKey(name: "items_image") String? itemsImage,
    @JsonKey(name: "items_active") int? itemsActive,
    @JsonKey(name: "weight_size_id") int? weightSizeId,
    @JsonKey(name: "sub_item_name") String? subItemName,
    @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
    @JsonKey(name: "sub_item_value") num? subItemValue,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
