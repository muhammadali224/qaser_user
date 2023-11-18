// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchesModelImpl _$$BranchesModelImplFromJson(Map<String, dynamic> json) =>
    _$BranchesModelImpl(
      branchId: json['branch_id'] as int?,
      branchNameAr: json['branch_name_ar'] as String?,
      branchNameEn: json['branch_name_en'] as String?,
      branchIsOpen: json['branch_is_open'] as int?,
      branchLang: (json['branch_lang'] as num?)?.toDouble(),
      branchLat: (json['branch_lat'] as num?)?.toDouble(),
      branchPhone1: json['branch_phone1'] as String?,
      branchPhone2: json['branch_phone2'] as String?,
      branchFacebookUrl: json['branch_facebook_url'] as String?,
      branchDeliveryCharge: json['branch_delivery_charge'] as num?,
      branchIsFixed: json['branch_isFixed'] as int?,
      branchZone: json['branch_zone'] as num?,
      branchDeliveryFixCharge: json['branch_delivery_fix_charge'] as num?,
      branchMaxZone: json['branch_max_zone'] as num?,
    );

Map<String, dynamic> _$$BranchesModelImplToJson(_$BranchesModelImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'branch_name_ar': instance.branchNameAr,
      'branch_name_en': instance.branchNameEn,
      'branch_is_open': instance.branchIsOpen,
      'branch_lang': instance.branchLang,
      'branch_lat': instance.branchLat,
      'branch_phone1': instance.branchPhone1,
      'branch_phone2': instance.branchPhone2,
      'branch_facebook_url': instance.branchFacebookUrl,
      'branch_delivery_charge': instance.branchDeliveryCharge,
      'branch_isFixed': instance.branchIsFixed,
      'branch_zone': instance.branchZone,
      'branch_delivery_fix_charge': instance.branchDeliveryFixCharge,
      'branch_max_zone': instance.branchMaxZone,
    };
