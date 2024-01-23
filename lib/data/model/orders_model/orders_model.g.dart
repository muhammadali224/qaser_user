// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersModelImpl _$$OrdersModelImplFromJson(Map<String, dynamic> json) =>
    _$OrdersModelImpl(
      ordersId: json['orders_id'] as int?,
      ordersUserid: json['orders_userid'] as int?,
      ordersAddress: json['orders_address'] as int?,
      ordersType: json['orders_type'] as int?,
      ordersDeliveryFee: json['orders_delivery_fee'] as num?,
      ordersPrice: json['orders_price'] as num?,
      ordersDiscountAmmount: json['orders_discount_ammount'] as num?,
      ordersTotalPrice: json['orders_total_price'] as num?,
      ordersCoupon: json['orders_coupon'] as int?,
      ordersState: json['orders_state'] as int?,
      ordersTime: json['orders_time'] == null
          ? null
          : DateTime.parse(json['orders_time'] as String),
      ordersRating: json['orders_rating'] as num?,
      ordersNote: json['orders_note'] as String?,
      ordersBranch: json['orders_branch'] as int?,
      addressId: json['address_id'] as int?,
      addressUserId: json['address_userId'] as int?,
      addressName: json['address_name'] as String?,
      addressCity: json['address_city'] as String?,
      addressStreet: json['address_street'] as String?,
      addressNote: json['address_note'] as String?,
      addressLat: json['address_lat'] as num?,
      addressLong: json['address_long'] as num?,
      branchNameAr: json['branch_name_ar'] as String?,
      branchNameEn: json['branch_name_en'] as String?,
      couponName: json['coupon_name'] as String?,
      usersName: json['users_name'] as String?,
      usersEmail: json['users_email'] as String?,
      usersPhone: json['users_phone'] as String?,
    );

Map<String, dynamic> _$$OrdersModelImplToJson(_$OrdersModelImpl instance) =>
    <String, dynamic>{
      'orders_id': instance.ordersId,
      'orders_userid': instance.ordersUserid,
      'orders_address': instance.ordersAddress,
      'orders_type': instance.ordersType,
      'orders_delivery_fee': instance.ordersDeliveryFee,
      'orders_price': instance.ordersPrice,
      'orders_discount_ammount': instance.ordersDiscountAmmount,
      'orders_total_price': instance.ordersTotalPrice,
      'orders_coupon': instance.ordersCoupon,
      'orders_state': instance.ordersState,
      'orders_time': instance.ordersTime?.toIso8601String(),
      'orders_rating': instance.ordersRating,
      'orders_note': instance.ordersNote,
      'orders_branch': instance.ordersBranch,
      'address_id': instance.addressId,
      'address_userId': instance.addressUserId,
      'address_name': instance.addressName,
      'address_city': instance.addressCity,
      'address_street': instance.addressStreet,
      'address_note': instance.addressNote,
      'address_lat': instance.addressLat,
      'address_long': instance.addressLong,
      'branch_name_ar': instance.branchNameAr,
      'branch_name_en': instance.branchNameEn,
      'coupon_name': instance.couponName,
      'users_name': instance.usersName,
      'users_email': instance.usersEmail,
      'users_phone': instance.usersPhone,
    };
