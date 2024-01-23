// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_model.freezed.dart';
part 'order_details_model.g.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

@freezed
class OrderDetailsModel with _$OrderDetailsModel {
  const factory OrderDetailsModel({
    @JsonKey(name: "cart_id") int? cartId,
    @JsonKey(name: "cart_userid") int? cartUserid,
    @JsonKey(name: "cart_itemid") int? cartItemid,
    @JsonKey(name: "cart_item_note") String? cartItemNote,
    @JsonKey(name: "cart_orders") int? cartOrders,
    @JsonKey(name: "cart_item_price") num? cartItemPrice,
    @JsonKey(name: "cart_item_count") int? cartItemCount,
    @JsonKey(name: "Item_point_count") int? itemPointCount,
    @JsonKey(name: "cart_branch_id") int? cartBranchId,
    @JsonKey(name: "cart_sub_items_id") int? cartSubItemsId,
    @JsonKey(name: "sub_item_id") int? subItemId,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sub_items_name") String? subItemsName,
    @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
    @JsonKey(name: "sub_items_price") num? subItemsPrice,
    @JsonKey(name: "sub_items_discount") num? subItemsDiscount,
    @JsonKey(name: "items_name") String? itemsName,
    @JsonKey(name: "items_name_ar") String? itemsNameAr,
    @JsonKey(name: "items_image") String? itemsImage,
  }) = _OrderDetailsModel;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);
}
