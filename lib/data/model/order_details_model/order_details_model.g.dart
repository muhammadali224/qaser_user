// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailsModelImpl _$$OrderDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailsModelImpl(
      cartId: json['cart_id'] as int?,
      cartUserid: json['cart_userid'] as int?,
      cartItemid: json['cart_itemid'] as int?,
      cartItemNote: json['cart_item_note'] as String?,
      cartOrders: json['cart_orders'] as int?,
      cartItemPrice: json['cart_item_price'] as num?,
      cartItemCount: json['cart_item_count'] as int?,
      itemPointCount: json['Item_point_count'] as int?,
      cartBranchId: json['cart_branch_id'] as int?,
      cartSubItemsId: json['cart_sub_items_id'] as int?,
      subItemId: json['sub_item_id'] as int?,
      itemId: json['item_id'] as int?,
      subItemsName: json['sub_items_name'] as String?,
      subItemsNameAr: json['sub_items_name_ar'] as String?,
      subItemsPrice: json['sub_items_price'] as num?,
      subItemsDiscount: json['sub_items_discount'] as num?,
      itemsName: json['items_name'] as String?,
      itemsNameAr: json['items_name_ar'] as String?,
      itemsImage: json['items_image'] as String?,
    );

Map<String, dynamic> _$$OrderDetailsModelImplToJson(
        _$OrderDetailsModelImpl instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'cart_userid': instance.cartUserid,
      'cart_itemid': instance.cartItemid,
      'cart_item_note': instance.cartItemNote,
      'cart_orders': instance.cartOrders,
      'cart_item_price': instance.cartItemPrice,
      'cart_item_count': instance.cartItemCount,
      'Item_point_count': instance.itemPointCount,
      'cart_branch_id': instance.cartBranchId,
      'cart_sub_items_id': instance.cartSubItemsId,
      'sub_item_id': instance.subItemId,
      'item_id': instance.itemId,
      'sub_items_name': instance.subItemsName,
      'sub_items_name_ar': instance.subItemsNameAr,
      'sub_items_price': instance.subItemsPrice,
      'sub_items_discount': instance.subItemsDiscount,
      'items_name': instance.itemsName,
      'items_name_ar': instance.itemsNameAr,
      'items_image': instance.itemsImage,
    };
