// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  @JsonKey(name: "cart_id")
  int? get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_userid")
  int? get cartUserid => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_itemid")
  int? get cartItemid => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_item_note")
  String? get cartItemNote => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_orders")
  int? get cartOrders => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_item_price")
  num? get cartItemPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_item_count")
  int? get cartItemCount => throw _privateConstructorUsedError;
  @JsonKey(name: "Item_point_count")
  num? get itemPointCount => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_branch_id")
  int? get cartBranchId => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_sub_items_id")
  int? get cartSubItemsId => throw _privateConstructorUsedError;
  @JsonKey(name: "items_id")
  int? get itemsId => throw _privateConstructorUsedError;
  @JsonKey(name: "items_name")
  String? get itemsName => throw _privateConstructorUsedError;
  @JsonKey(name: "items_name_ar")
  String? get itemsNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "items_image")
  String? get itemsImage => throw _privateConstructorUsedError;
  @JsonKey(name: "items_active")
  int? get itemsActive => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_id")
  int? get subItemId => throw _privateConstructorUsedError;
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_items_name")
  String? get subItemsName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_items_name_ar")
  String? get subItemsNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_items_price")
  num? get subItemsPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "cart_id") int? cartId,
      @JsonKey(name: "cart_userid") int? cartUserid,
      @JsonKey(name: "cart_itemid") int? cartItemid,
      @JsonKey(name: "cart_item_note") String? cartItemNote,
      @JsonKey(name: "cart_orders") int? cartOrders,
      @JsonKey(name: "cart_item_price") num? cartItemPrice,
      @JsonKey(name: "cart_item_count") int? cartItemCount,
      @JsonKey(name: "Item_point_count") num? itemPointCount,
      @JsonKey(name: "cart_branch_id") int? cartBranchId,
      @JsonKey(name: "cart_sub_items_id") int? cartSubItemsId,
      @JsonKey(name: "items_id") int? itemsId,
      @JsonKey(name: "items_name") String? itemsName,
      @JsonKey(name: "items_name_ar") String? itemsNameAr,
      @JsonKey(name: "items_image") String? itemsImage,
      @JsonKey(name: "items_active") int? itemsActive,
      @JsonKey(name: "sub_item_id") int? subItemId,
      @JsonKey(name: "item_id") int? itemId,
      @JsonKey(name: "sub_items_name") String? subItemsName,
      @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
      @JsonKey(name: "sub_items_price") num? subItemsPrice});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = freezed,
    Object? cartUserid = freezed,
    Object? cartItemid = freezed,
    Object? cartItemNote = freezed,
    Object? cartOrders = freezed,
    Object? cartItemPrice = freezed,
    Object? cartItemCount = freezed,
    Object? itemPointCount = freezed,
    Object? cartBranchId = freezed,
    Object? cartSubItemsId = freezed,
    Object? itemsId = freezed,
    Object? itemsName = freezed,
    Object? itemsNameAr = freezed,
    Object? itemsImage = freezed,
    Object? itemsActive = freezed,
    Object? subItemId = freezed,
    Object? itemId = freezed,
    Object? subItemsName = freezed,
    Object? subItemsNameAr = freezed,
    Object? subItemsPrice = freezed,
  }) {
    return _then(_value.copyWith(
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      cartUserid: freezed == cartUserid
          ? _value.cartUserid
          : cartUserid // ignore: cast_nullable_to_non_nullable
              as int?,
      cartItemid: freezed == cartItemid
          ? _value.cartItemid
          : cartItemid // ignore: cast_nullable_to_non_nullable
              as int?,
      cartItemNote: freezed == cartItemNote
          ? _value.cartItemNote
          : cartItemNote // ignore: cast_nullable_to_non_nullable
              as String?,
      cartOrders: freezed == cartOrders
          ? _value.cartOrders
          : cartOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      cartItemPrice: freezed == cartItemPrice
          ? _value.cartItemPrice
          : cartItemPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      cartItemCount: freezed == cartItemCount
          ? _value.cartItemCount
          : cartItemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPointCount: freezed == itemPointCount
          ? _value.itemPointCount
          : itemPointCount // ignore: cast_nullable_to_non_nullable
              as num?,
      cartBranchId: freezed == cartBranchId
          ? _value.cartBranchId
          : cartBranchId // ignore: cast_nullable_to_non_nullable
              as int?,
      cartSubItemsId: freezed == cartSubItemsId
          ? _value.cartSubItemsId
          : cartSubItemsId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsId: freezed == itemsId
          ? _value.itemsId
          : itemsId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsName: freezed == itemsName
          ? _value.itemsName
          : itemsName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsNameAr: freezed == itemsNameAr
          ? _value.itemsNameAr
          : itemsNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsImage: freezed == itemsImage
          ? _value.itemsImage
          : itemsImage // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsActive: freezed == itemsActive
          ? _value.itemsActive
          : itemsActive // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemId: freezed == subItemId
          ? _value.subItemId
          : subItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemsName: freezed == subItemsName
          ? _value.subItemsName
          : subItemsName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsNameAr: freezed == subItemsNameAr
          ? _value.subItemsNameAr
          : subItemsNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsPrice: freezed == subItemsPrice
          ? _value.subItemsPrice
          : subItemsPrice // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "cart_id") int? cartId,
      @JsonKey(name: "cart_userid") int? cartUserid,
      @JsonKey(name: "cart_itemid") int? cartItemid,
      @JsonKey(name: "cart_item_note") String? cartItemNote,
      @JsonKey(name: "cart_orders") int? cartOrders,
      @JsonKey(name: "cart_item_price") num? cartItemPrice,
      @JsonKey(name: "cart_item_count") int? cartItemCount,
      @JsonKey(name: "Item_point_count") num? itemPointCount,
      @JsonKey(name: "cart_branch_id") int? cartBranchId,
      @JsonKey(name: "cart_sub_items_id") int? cartSubItemsId,
      @JsonKey(name: "items_id") int? itemsId,
      @JsonKey(name: "items_name") String? itemsName,
      @JsonKey(name: "items_name_ar") String? itemsNameAr,
      @JsonKey(name: "items_image") String? itemsImage,
      @JsonKey(name: "items_active") int? itemsActive,
      @JsonKey(name: "sub_item_id") int? subItemId,
      @JsonKey(name: "item_id") int? itemId,
      @JsonKey(name: "sub_items_name") String? subItemsName,
      @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
      @JsonKey(name: "sub_items_price") num? subItemsPrice});
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = freezed,
    Object? cartUserid = freezed,
    Object? cartItemid = freezed,
    Object? cartItemNote = freezed,
    Object? cartOrders = freezed,
    Object? cartItemPrice = freezed,
    Object? cartItemCount = freezed,
    Object? itemPointCount = freezed,
    Object? cartBranchId = freezed,
    Object? cartSubItemsId = freezed,
    Object? itemsId = freezed,
    Object? itemsName = freezed,
    Object? itemsNameAr = freezed,
    Object? itemsImage = freezed,
    Object? itemsActive = freezed,
    Object? subItemId = freezed,
    Object? itemId = freezed,
    Object? subItemsName = freezed,
    Object? subItemsNameAr = freezed,
    Object? subItemsPrice = freezed,
  }) {
    return _then(_$CartModelImpl(
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      cartUserid: freezed == cartUserid
          ? _value.cartUserid
          : cartUserid // ignore: cast_nullable_to_non_nullable
              as int?,
      cartItemid: freezed == cartItemid
          ? _value.cartItemid
          : cartItemid // ignore: cast_nullable_to_non_nullable
              as int?,
      cartItemNote: freezed == cartItemNote
          ? _value.cartItemNote
          : cartItemNote // ignore: cast_nullable_to_non_nullable
              as String?,
      cartOrders: freezed == cartOrders
          ? _value.cartOrders
          : cartOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      cartItemPrice: freezed == cartItemPrice
          ? _value.cartItemPrice
          : cartItemPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      cartItemCount: freezed == cartItemCount
          ? _value.cartItemCount
          : cartItemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPointCount: freezed == itemPointCount
          ? _value.itemPointCount
          : itemPointCount // ignore: cast_nullable_to_non_nullable
              as num?,
      cartBranchId: freezed == cartBranchId
          ? _value.cartBranchId
          : cartBranchId // ignore: cast_nullable_to_non_nullable
              as int?,
      cartSubItemsId: freezed == cartSubItemsId
          ? _value.cartSubItemsId
          : cartSubItemsId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsId: freezed == itemsId
          ? _value.itemsId
          : itemsId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsName: freezed == itemsName
          ? _value.itemsName
          : itemsName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsNameAr: freezed == itemsNameAr
          ? _value.itemsNameAr
          : itemsNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsImage: freezed == itemsImage
          ? _value.itemsImage
          : itemsImage // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsActive: freezed == itemsActive
          ? _value.itemsActive
          : itemsActive // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemId: freezed == subItemId
          ? _value.subItemId
          : subItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemsName: freezed == subItemsName
          ? _value.subItemsName
          : subItemsName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsNameAr: freezed == subItemsNameAr
          ? _value.subItemsNameAr
          : subItemsNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsPrice: freezed == subItemsPrice
          ? _value.subItemsPrice
          : subItemsPrice // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartModelImpl implements _CartModel {
  const _$CartModelImpl(
      {@JsonKey(name: "cart_id") this.cartId,
      @JsonKey(name: "cart_userid") this.cartUserid,
      @JsonKey(name: "cart_itemid") this.cartItemid,
      @JsonKey(name: "cart_item_note") this.cartItemNote,
      @JsonKey(name: "cart_orders") this.cartOrders,
      @JsonKey(name: "cart_item_price") this.cartItemPrice,
      @JsonKey(name: "cart_item_count") this.cartItemCount,
      @JsonKey(name: "Item_point_count") this.itemPointCount,
      @JsonKey(name: "cart_branch_id") this.cartBranchId,
      @JsonKey(name: "cart_sub_items_id") this.cartSubItemsId,
      @JsonKey(name: "items_id") this.itemsId,
      @JsonKey(name: "items_name") this.itemsName,
      @JsonKey(name: "items_name_ar") this.itemsNameAr,
      @JsonKey(name: "items_image") this.itemsImage,
      @JsonKey(name: "items_active") this.itemsActive,
      @JsonKey(name: "sub_item_id") this.subItemId,
      @JsonKey(name: "item_id") this.itemId,
      @JsonKey(name: "sub_items_name") this.subItemsName,
      @JsonKey(name: "sub_items_name_ar") this.subItemsNameAr,
      @JsonKey(name: "sub_items_price") this.subItemsPrice});

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  @JsonKey(name: "cart_id")
  final int? cartId;
  @override
  @JsonKey(name: "cart_userid")
  final int? cartUserid;
  @override
  @JsonKey(name: "cart_itemid")
  final int? cartItemid;
  @override
  @JsonKey(name: "cart_item_note")
  final String? cartItemNote;
  @override
  @JsonKey(name: "cart_orders")
  final int? cartOrders;
  @override
  @JsonKey(name: "cart_item_price")
  final num? cartItemPrice;
  @override
  @JsonKey(name: "cart_item_count")
  final int? cartItemCount;
  @override
  @JsonKey(name: "Item_point_count")
  final num? itemPointCount;
  @override
  @JsonKey(name: "cart_branch_id")
  final int? cartBranchId;
  @override
  @JsonKey(name: "cart_sub_items_id")
  final int? cartSubItemsId;
  @override
  @JsonKey(name: "items_id")
  final int? itemsId;
  @override
  @JsonKey(name: "items_name")
  final String? itemsName;
  @override
  @JsonKey(name: "items_name_ar")
  final String? itemsNameAr;
  @override
  @JsonKey(name: "items_image")
  final String? itemsImage;
  @override
  @JsonKey(name: "items_active")
  final int? itemsActive;
  @override
  @JsonKey(name: "sub_item_id")
  final int? subItemId;
  @override
  @JsonKey(name: "item_id")
  final int? itemId;
  @override
  @JsonKey(name: "sub_items_name")
  final String? subItemsName;
  @override
  @JsonKey(name: "sub_items_name_ar")
  final String? subItemsNameAr;
  @override
  @JsonKey(name: "sub_items_price")
  final num? subItemsPrice;

  @override
  String toString() {
    return 'CartModel(cartId: $cartId, cartUserid: $cartUserid, cartItemid: $cartItemid, cartItemNote: $cartItemNote, cartOrders: $cartOrders, cartItemPrice: $cartItemPrice, cartItemCount: $cartItemCount, itemPointCount: $itemPointCount, cartBranchId: $cartBranchId, cartSubItemsId: $cartSubItemsId, itemsId: $itemsId, itemsName: $itemsName, itemsNameAr: $itemsNameAr, itemsImage: $itemsImage, itemsActive: $itemsActive, subItemId: $subItemId, itemId: $itemId, subItemsName: $subItemsName, subItemsNameAr: $subItemsNameAr, subItemsPrice: $subItemsPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.cartUserid, cartUserid) ||
                other.cartUserid == cartUserid) &&
            (identical(other.cartItemid, cartItemid) ||
                other.cartItemid == cartItemid) &&
            (identical(other.cartItemNote, cartItemNote) ||
                other.cartItemNote == cartItemNote) &&
            (identical(other.cartOrders, cartOrders) ||
                other.cartOrders == cartOrders) &&
            (identical(other.cartItemPrice, cartItemPrice) ||
                other.cartItemPrice == cartItemPrice) &&
            (identical(other.cartItemCount, cartItemCount) ||
                other.cartItemCount == cartItemCount) &&
            (identical(other.itemPointCount, itemPointCount) ||
                other.itemPointCount == itemPointCount) &&
            (identical(other.cartBranchId, cartBranchId) ||
                other.cartBranchId == cartBranchId) &&
            (identical(other.cartSubItemsId, cartSubItemsId) ||
                other.cartSubItemsId == cartSubItemsId) &&
            (identical(other.itemsId, itemsId) || other.itemsId == itemsId) &&
            (identical(other.itemsName, itemsName) ||
                other.itemsName == itemsName) &&
            (identical(other.itemsNameAr, itemsNameAr) ||
                other.itemsNameAr == itemsNameAr) &&
            (identical(other.itemsImage, itemsImage) ||
                other.itemsImage == itemsImage) &&
            (identical(other.itemsActive, itemsActive) ||
                other.itemsActive == itemsActive) &&
            (identical(other.subItemId, subItemId) ||
                other.subItemId == subItemId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.subItemsName, subItemsName) ||
                other.subItemsName == subItemsName) &&
            (identical(other.subItemsNameAr, subItemsNameAr) ||
                other.subItemsNameAr == subItemsNameAr) &&
            (identical(other.subItemsPrice, subItemsPrice) ||
                other.subItemsPrice == subItemsPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        cartId,
        cartUserid,
        cartItemid,
        cartItemNote,
        cartOrders,
        cartItemPrice,
        cartItemCount,
        itemPointCount,
        cartBranchId,
        cartSubItemsId,
        itemsId,
        itemsName,
        itemsNameAr,
        itemsImage,
        itemsActive,
        subItemId,
        itemId,
        subItemsName,
        subItemsNameAr,
        subItemsPrice
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(
      this,
    );
  }
}

abstract class _CartModel implements CartModel {
  const factory _CartModel(
          {@JsonKey(name: "cart_id") final int? cartId,
          @JsonKey(name: "cart_userid") final int? cartUserid,
          @JsonKey(name: "cart_itemid") final int? cartItemid,
          @JsonKey(name: "cart_item_note") final String? cartItemNote,
          @JsonKey(name: "cart_orders") final int? cartOrders,
          @JsonKey(name: "cart_item_price") final num? cartItemPrice,
          @JsonKey(name: "cart_item_count") final int? cartItemCount,
          @JsonKey(name: "Item_point_count") final num? itemPointCount,
          @JsonKey(name: "cart_branch_id") final int? cartBranchId,
          @JsonKey(name: "cart_sub_items_id") final int? cartSubItemsId,
          @JsonKey(name: "items_id") final int? itemsId,
          @JsonKey(name: "items_name") final String? itemsName,
          @JsonKey(name: "items_name_ar") final String? itemsNameAr,
          @JsonKey(name: "items_image") final String? itemsImage,
          @JsonKey(name: "items_active") final int? itemsActive,
          @JsonKey(name: "sub_item_id") final int? subItemId,
          @JsonKey(name: "item_id") final int? itemId,
          @JsonKey(name: "sub_items_name") final String? subItemsName,
          @JsonKey(name: "sub_items_name_ar") final String? subItemsNameAr,
          @JsonKey(name: "sub_items_price") final num? subItemsPrice}) =
      _$CartModelImpl;

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  @JsonKey(name: "cart_id")
  int? get cartId;
  @override
  @JsonKey(name: "cart_userid")
  int? get cartUserid;
  @override
  @JsonKey(name: "cart_itemid")
  int? get cartItemid;
  @override
  @JsonKey(name: "cart_item_note")
  String? get cartItemNote;
  @override
  @JsonKey(name: "cart_orders")
  int? get cartOrders;
  @override
  @JsonKey(name: "cart_item_price")
  num? get cartItemPrice;
  @override
  @JsonKey(name: "cart_item_count")
  int? get cartItemCount;
  @override
  @JsonKey(name: "Item_point_count")
  num? get itemPointCount;
  @override
  @JsonKey(name: "cart_branch_id")
  int? get cartBranchId;
  @override
  @JsonKey(name: "cart_sub_items_id")
  int? get cartSubItemsId;
  @override
  @JsonKey(name: "items_id")
  int? get itemsId;
  @override
  @JsonKey(name: "items_name")
  String? get itemsName;
  @override
  @JsonKey(name: "items_name_ar")
  String? get itemsNameAr;
  @override
  @JsonKey(name: "items_image")
  String? get itemsImage;
  @override
  @JsonKey(name: "items_active")
  int? get itemsActive;
  @override
  @JsonKey(name: "sub_item_id")
  int? get subItemId;
  @override
  @JsonKey(name: "item_id")
  int? get itemId;
  @override
  @JsonKey(name: "sub_items_name")
  String? get subItemsName;
  @override
  @JsonKey(name: "sub_items_name_ar")
  String? get subItemsNameAr;
  @override
  @JsonKey(name: "sub_items_price")
  num? get subItemsPrice;
  @override
  @JsonKey(ignore: true)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
