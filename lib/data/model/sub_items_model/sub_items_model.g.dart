// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubItemsModelImpl _$$SubItemsModelImplFromJson(Map<String, dynamic> json) =>
    _$SubItemsModelImpl(
      weightSizeId: json['weight_size_id'] as int?,
      subItemName: json['sub_item_name'] as String?,
      subItemNameAr: json['sub_item_name_ar'] as String?,
      subItemValue: json['sub_item_value'] as num?,
    );

Map<String, dynamic> _$$SubItemsModelImplToJson(_$SubItemsModelImpl instance) =>
    <String, dynamic>{
      'weight_size_id': instance.weightSizeId,
      'sub_item_name': instance.subItemName,
      'sub_item_name_ar': instance.subItemNameAr,
      'sub_item_value': instance.subItemValue,
    };
