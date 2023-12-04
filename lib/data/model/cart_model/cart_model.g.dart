// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      cartId: json['cart_id'] as int?,
      cartUserid: json['cart_userid'] as int?,
      cartItemid: json['cart_itemid'] as int?,
      cartItemNote: json['cart_item_note'] as String?,
      cartOrders: json['cart_orders'] as int?,
      cartSizeWeightId: json['cart_size_weight_id'] as int?,
      cartItemPrice: json['cart_item_price'] as num?,
      cartBranchId: json['cart_branch_id'] as int?,
      cartItemPoint: json['Item_point_count'] as num?,
      cartItemCount: json['cart_item_count'] as int?,
      itemsId: json['items_id'] as int?,
      itemsName: json['items_name'] as String?,
      itemsNameAr: json['items_name_ar'] as String?,
      itemsImage: json['items_image'] as String?,
      itemsActive: json['items_active'] as int?,
      weightSizeId: json['weight_size_id'] as int?,
      subItemName: json['sub_item_name'] as String?,
      subItemNameAr: json['sub_item_name_ar'] as String?,
      subItemValue: json['sub_item_value'] as num?,
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'cart_userid': instance.cartUserid,
      'cart_itemid': instance.cartItemid,
      'cart_item_note': instance.cartItemNote,
      'cart_orders': instance.cartOrders,
      'cart_size_weight_id': instance.cartSizeWeightId,
      'cart_item_price': instance.cartItemPrice,
      'cart_branch_id': instance.cartBranchId,
      'Item_point_count': instance.cartItemPoint,
      'cart_item_count': instance.cartItemCount,
      'items_id': instance.itemsId,
      'items_name': instance.itemsName,
      'items_name_ar': instance.itemsNameAr,
      'items_image': instance.itemsImage,
      'items_active': instance.itemsActive,
      'weight_size_id': instance.weightSizeId,
      'sub_item_name': instance.subItemName,
      'sub_item_name_ar': instance.subItemNameAr,
      'sub_item_value': instance.subItemValue,
    };
