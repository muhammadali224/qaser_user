// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubItemModelImpl _$$SubItemModelImplFromJson(Map<String, dynamic> json) =>
    _$SubItemModelImpl(
      subItemId: json['sub_item_id'] as int?,
      itemId: json['item_id'] as int?,
      subItemsName: json['sub_items_name'] as String?,
      subItemsNameAr: json['sub_items_name_ar'] as String?,
      subItemsPrice: json['sub_items_price'] as num?,
      subItemsDiscount: json['sub_items_discount'] as num?,
    );

Map<String, dynamic> _$$SubItemModelImplToJson(_$SubItemModelImpl instance) =>
    <String, dynamic>{
      'sub_item_id': instance.subItemId,
      'item_id': instance.itemId,
      'sub_items_name': instance.subItemsName,
      'sub_items_name_ar': instance.subItemsNameAr,
      'sub_items_price': instance.subItemsPrice,
      'sub_items_discount': instance.subItemsDiscount,
    };
