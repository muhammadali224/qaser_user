// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

OrdersModel ordersModelFromJson(String str) =>
    OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

@freezed
class OrdersModel with _$OrdersModel {
  const factory OrdersModel({
    @JsonKey(name: "orders_id") int? ordersId,
    @JsonKey(name: "orders_userid") int? ordersUserid,
    @JsonKey(name: "orders_address") int? ordersAddress,
    @JsonKey(name: "orders_type") int? ordersType,
    @JsonKey(name: "orders_delivery_fee") num? ordersDeliveryFee,
    @JsonKey(name: "orders_price") num? ordersPrice,
    @JsonKey(name: "orders_discount_ammount") num? ordersDiscountAmmount,
    @JsonKey(name: "orders_total_price") num? ordersTotalPrice,
    @JsonKey(name: "orders_coupon") int? ordersCoupon,
    @JsonKey(name: "orders_state") int? ordersState,
    @JsonKey(name: "orders_time") DateTime? ordersTime,
    @JsonKey(name: "orders_rating") num? ordersRating,
    @JsonKey(name: "orders_points") num? ordersPoints,
    @JsonKey(name: "orders_note") String? ordersNote,
    @JsonKey(name: "orders_branch") int? ordersBranch,
    @JsonKey(name: "address_id") int? addressId,
    @JsonKey(name: "address_userId") int? addressUserId,
    @JsonKey(name: "address_name") String? addressName,
    @JsonKey(name: "address_city") String? addressCity,
    @JsonKey(name: "address_street") String? addressStreet,
    @JsonKey(name: "address_note") String? addressNote,
    @JsonKey(name: "address_lat") num? addressLat,
    @JsonKey(name: "address_long") num? addressLong,
    @JsonKey(name: "branch_name_ar") String? branchNameAr,
    @JsonKey(name: "branch_name_en") String? branchNameEn,
    @JsonKey(name: "coupon_name") String? couponName,
    @JsonKey(name: "users_name") String? usersName,
    @JsonKey(name: "users_email") String? usersEmail,
    @JsonKey(name: "users_phone") String? usersPhone,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
}
