// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'awards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwardsModelImpl _$$AwardsModelImplFromJson(Map<String, dynamic> json) =>
    _$AwardsModelImpl(
      itemsPointId: json['items_point_id'] as int?,
      itemsPointName: json['items_point_name'] as String?,
      itemsPointNameAr: json['items_point_name_ar'] as String?,
      itemsPointStartDate: json['items_point_start_date'] == null
          ? null
          : DateTime.parse(json['items_point_start_date'] as String),
      itemsPointExpireDate: json['items_point_expire_date'] == null
          ? null
          : DateTime.parse(json['items_point_expire_date'] as String),
      itemsPointCount: json['items_point_count'] as int?,
      itemsPointUserReplacment: json['items_point_user_replacment'] as int?,
      itemsPointPrice: json['items_point_price'] as int?,
      itemsPointIsActive: json['items_point_is_active'] as int?,
      itemsPointImage: json['items_point_image'] as String?,
    );

Map<String, dynamic> _$$AwardsModelImplToJson(_$AwardsModelImpl instance) =>
    <String, dynamic>{
      'items_point_id': instance.itemsPointId,
      'items_point_name': instance.itemsPointName,
      'items_point_name_ar': instance.itemsPointNameAr,
      'items_point_start_date': instance.itemsPointStartDate?.toIso8601String(),
      'items_point_expire_date':
          instance.itemsPointExpireDate?.toIso8601String(),
      'items_point_count': instance.itemsPointCount,
      'items_point_user_replacment': instance.itemsPointUserReplacment,
      'items_point_price': instance.itemsPointPrice,
      'items_point_is_active': instance.itemsPointIsActive,
      'items_point_image': instance.itemsPointImage,
    };
