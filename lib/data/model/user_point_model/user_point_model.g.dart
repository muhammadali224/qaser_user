// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPointModelImpl _$$UserPointModelImplFromJson(Map<String, dynamic> json) =>
    _$UserPointModelImpl(
      userPointId: json['user_point_id'] as int?,
      userPointUserId: json['user_point_user_id'] as int?,
      pointsCount: json['points_count'] as num?,
      pointDescreptionEn: json['point_descreption_en'] as String?,
      pointDescreption: json['point_descreption'] as String?,
      createDate: json['create_date'] == null
          ? null
          : DateTime.parse(json['create_date'] as String),
      expireDate: json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String),
      isExpired: json['is_Expired'] as int?,
    );

Map<String, dynamic> _$$UserPointModelImplToJson(
        _$UserPointModelImpl instance) =>
    <String, dynamic>{
      'user_point_id': instance.userPointId,
      'user_point_user_id': instance.userPointUserId,
      'points_count': instance.pointsCount,
      'point_descreption_en': instance.pointDescreptionEn,
      'point_descreption': instance.pointDescreption,
      'create_date': instance.createDate?.toIso8601String(),
      'expire_date': instance.expireDate?.toIso8601String(),
      'is_Expired': instance.isExpired,
    };
