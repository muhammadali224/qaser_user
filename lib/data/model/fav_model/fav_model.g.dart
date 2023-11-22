// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      itemsId: json['items_id'] as int?,
      itemsName: json['items_name'] as String?,
      itemsNameAr: json['items_name_ar'] as String?,
      itemsDesc: json['items_desc'] as String?,
      itemsDescAr: json['items_desc_ar'] as String?,
      itemsImage: json['items_image'] as String?,
      itemsCount: json['items_count'] as int?,
      itemsActive: json['items_active'] as int?,
      itemsPrice: json['items_price'] as num?,
      itemsDiscount: json['items_discount'] as num?,
      itemsPointPerVal: json['items_point_per_val'] as num?,
      itemsData: json['items_data'] == null
          ? null
          : DateTime.parse(json['items_data'] as String),
      itemsCat: json['items_cat'] as int?,
      branchId: json['branch_id'] as int?,
      categoriesId: json['categories_id'] as int?,
      categoriesName: json['categories_name'] as String?,
      categoriesNameAr: json['categories_name_ar'] as String?,
      categoriesImage: json['categories_image'] as String?,
      itemDiscounntPrice: json['itemDiscounnt_price'] as num?,
      favoriteId: json['favorite_id'] as int?,
      favoriteUserId: json['favorite_userId'] as int?,
      favoriteItemId: json['favorite_itemId'] as int?,
      favoriteStatus: json['favorite_status'] as int?,
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'items_id': instance.itemsId,
      'items_name': instance.itemsName,
      'items_name_ar': instance.itemsNameAr,
      'items_desc': instance.itemsDesc,
      'items_desc_ar': instance.itemsDescAr,
      'items_image': instance.itemsImage,
      'items_count': instance.itemsCount,
      'items_active': instance.itemsActive,
      'items_price': instance.itemsPrice,
      'items_discount': instance.itemsDiscount,
      'items_point_per_val': instance.itemsPointPerVal,
      'items_data': instance.itemsData?.toIso8601String(),
      'items_cat': instance.itemsCat,
      'branch_id': instance.branchId,
      'categories_id': instance.categoriesId,
      'categories_name': instance.categoriesName,
      'categories_name_ar': instance.categoriesNameAr,
      'categories_image': instance.categoriesImage,
      'itemDiscounnt_price': instance.itemDiscounntPrice,
      'favorite_id': instance.favoriteId,
      'favorite_userId': instance.favoriteUserId,
      'favorite_itemId': instance.favoriteItemId,
      'favorite_status': instance.favoriteStatus,
    };
