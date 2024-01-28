// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _OrdersModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  @JsonKey(name: "orders_id")
  int? get ordersId => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_userid")
  int? get ordersUserid => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_address")
  int? get ordersAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_type")
  int? get ordersType => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_delivery_fee")
  num? get ordersDeliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_price")
  num? get ordersPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_discount_ammount")
  num? get ordersDiscountAmmount => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_total_price")
  num? get ordersTotalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_coupon")
  int? get ordersCoupon => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_state")
  int? get ordersState => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_time")
  DateTime? get ordersTime => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_rating")
  num? get ordersRating => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_points")
  num? get ordersPoints => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_note")
  String? get ordersNote => throw _privateConstructorUsedError;
  @JsonKey(name: "orders_branch")
  int? get ordersBranch => throw _privateConstructorUsedError;
  @JsonKey(name: "address_id")
  int? get addressId => throw _privateConstructorUsedError;
  @JsonKey(name: "address_userId")
  int? get addressUserId => throw _privateConstructorUsedError;
  @JsonKey(name: "address_name")
  String? get addressName => throw _privateConstructorUsedError;
  @JsonKey(name: "address_city")
  String? get addressCity => throw _privateConstructorUsedError;
  @JsonKey(name: "address_street")
  String? get addressStreet => throw _privateConstructorUsedError;
  @JsonKey(name: "address_note")
  String? get addressNote => throw _privateConstructorUsedError;
  @JsonKey(name: "address_lat")
  num? get addressLat => throw _privateConstructorUsedError;
  @JsonKey(name: "address_long")
  num? get addressLong => throw _privateConstructorUsedError;
  @JsonKey(name: "branch_name_ar")
  String? get branchNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "branch_name_en")
  String? get branchNameEn => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_name")
  String? get couponName => throw _privateConstructorUsedError;
  @JsonKey(name: "users_name")
  String? get usersName => throw _privateConstructorUsedError;
  @JsonKey(name: "users_email")
  String? get usersEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "users_phone")
  String? get usersPhone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
          OrdersModel value, $Res Function(OrdersModel) then) =
      _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "orders_id") int? ordersId,
      @JsonKey(name: "orders_userid") int? ordersUserid,
      @JsonKey(name: "orders_address") int? ordersAddress,
      @JsonKey(name: "orders_type") int? ordersType,
      @JsonKey(name: "orders_delivery_fee") num? ordersDeliveryFee,
      @JsonKey(name: "orders_price") num? ordersPrice,
      @JsonKey(name: "orders_discount_ammount") num? ordersDiscountAmmount,
      @JsonKey(name: "orders_total_price") num? ordersTotalPrice,
      @JsonKey(name: "orders_coupon") int? ordersCoupon,
      @JsonKey(name: "orders_state") int? ordersState,
      @JsonKey(name: "orders_time") DateTime? ordersTime,
      @JsonKey(name: "orders_rating") num? ordersRating,
      @JsonKey(name: "orders_points") num? ordersPoints,
      @JsonKey(name: "orders_note") String? ordersNote,
      @JsonKey(name: "orders_branch") int? ordersBranch,
      @JsonKey(name: "address_id") int? addressId,
      @JsonKey(name: "address_userId") int? addressUserId,
      @JsonKey(name: "address_name") String? addressName,
      @JsonKey(name: "address_city") String? addressCity,
      @JsonKey(name: "address_street") String? addressStreet,
      @JsonKey(name: "address_note") String? addressNote,
      @JsonKey(name: "address_lat") num? addressLat,
      @JsonKey(name: "address_long") num? addressLong,
      @JsonKey(name: "branch_name_ar") String? branchNameAr,
      @JsonKey(name: "branch_name_en") String? branchNameEn,
      @JsonKey(name: "coupon_name") String? couponName,
      @JsonKey(name: "users_name") String? usersName,
      @JsonKey(name: "users_email") String? usersEmail,
      @JsonKey(name: "users_phone") String? usersPhone});
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordersId = freezed,
    Object? ordersUserid = freezed,
    Object? ordersAddress = freezed,
    Object? ordersType = freezed,
    Object? ordersDeliveryFee = freezed,
    Object? ordersPrice = freezed,
    Object? ordersDiscountAmmount = freezed,
    Object? ordersTotalPrice = freezed,
    Object? ordersCoupon = freezed,
    Object? ordersState = freezed,
    Object? ordersTime = freezed,
    Object? ordersRating = freezed,
    Object? ordersPoints = freezed,
    Object? ordersNote = freezed,
    Object? ordersBranch = freezed,
    Object? addressId = freezed,
    Object? addressUserId = freezed,
    Object? addressName = freezed,
    Object? addressCity = freezed,
    Object? addressStreet = freezed,
    Object? addressNote = freezed,
    Object? addressLat = freezed,
    Object? addressLong = freezed,
    Object? branchNameAr = freezed,
    Object? branchNameEn = freezed,
    Object? couponName = freezed,
    Object? usersName = freezed,
    Object? usersEmail = freezed,
    Object? usersPhone = freezed,
  }) {
    return _then(_value.copyWith(
      ordersId: freezed == ordersId
          ? _value.ordersId
          : ordersId // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersUserid: freezed == ordersUserid
          ? _value.ordersUserid
          : ordersUserid // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersAddress: freezed == ordersAddress
          ? _value.ordersAddress
          : ordersAddress // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersType: freezed == ordersType
          ? _value.ordersType
          : ordersType // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersDeliveryFee: freezed == ordersDeliveryFee
          ? _value.ordersDeliveryFee
          : ordersDeliveryFee // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersPrice: freezed == ordersPrice
          ? _value.ordersPrice
          : ordersPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersDiscountAmmount: freezed == ordersDiscountAmmount
          ? _value.ordersDiscountAmmount
          : ordersDiscountAmmount // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersTotalPrice: freezed == ordersTotalPrice
          ? _value.ordersTotalPrice
          : ordersTotalPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersCoupon: freezed == ordersCoupon
          ? _value.ordersCoupon
          : ordersCoupon // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersState: freezed == ordersState
          ? _value.ordersState
          : ordersState // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersTime: freezed == ordersTime
          ? _value.ordersTime
          : ordersTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ordersRating: freezed == ordersRating
          ? _value.ordersRating
          : ordersRating // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersPoints: freezed == ordersPoints
          ? _value.ordersPoints
          : ordersPoints // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersNote: freezed == ordersNote
          ? _value.ordersNote
          : ordersNote // ignore: cast_nullable_to_non_nullable
              as String?,
      ordersBranch: freezed == ordersBranch
          ? _value.ordersBranch
          : ordersBranch // ignore: cast_nullable_to_non_nullable
              as int?,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      addressUserId: freezed == addressUserId
          ? _value.addressUserId
          : addressUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressCity: freezed == addressCity
          ? _value.addressCity
          : addressCity // ignore: cast_nullable_to_non_nullable
              as String?,
      addressStreet: freezed == addressStreet
          ? _value.addressStreet
          : addressStreet // ignore: cast_nullable_to_non_nullable
              as String?,
      addressNote: freezed == addressNote
          ? _value.addressNote
          : addressNote // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLat: freezed == addressLat
          ? _value.addressLat
          : addressLat // ignore: cast_nullable_to_non_nullable
              as num?,
      addressLong: freezed == addressLong
          ? _value.addressLong
          : addressLong // ignore: cast_nullable_to_non_nullable
              as num?,
      branchNameAr: freezed == branchNameAr
          ? _value.branchNameAr
          : branchNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      branchNameEn: freezed == branchNameEn
          ? _value.branchNameEn
          : branchNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      couponName: freezed == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String?,
      usersName: freezed == usersName
          ? _value.usersName
          : usersName // ignore: cast_nullable_to_non_nullable
              as String?,
      usersEmail: freezed == usersEmail
          ? _value.usersEmail
          : usersEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      usersPhone: freezed == usersPhone
          ? _value.usersPhone
          : usersPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersModelImplCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$OrdersModelImplCopyWith(
          _$OrdersModelImpl value, $Res Function(_$OrdersModelImpl) then) =
      __$$OrdersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "orders_id") int? ordersId,
      @JsonKey(name: "orders_userid") int? ordersUserid,
      @JsonKey(name: "orders_address") int? ordersAddress,
      @JsonKey(name: "orders_type") int? ordersType,
      @JsonKey(name: "orders_delivery_fee") num? ordersDeliveryFee,
      @JsonKey(name: "orders_price") num? ordersPrice,
      @JsonKey(name: "orders_discount_ammount") num? ordersDiscountAmmount,
      @JsonKey(name: "orders_total_price") num? ordersTotalPrice,
      @JsonKey(name: "orders_coupon") int? ordersCoupon,
      @JsonKey(name: "orders_state") int? ordersState,
      @JsonKey(name: "orders_time") DateTime? ordersTime,
      @JsonKey(name: "orders_rating") num? ordersRating,
      @JsonKey(name: "orders_points") num? ordersPoints,
      @JsonKey(name: "orders_note") String? ordersNote,
      @JsonKey(name: "orders_branch") int? ordersBranch,
      @JsonKey(name: "address_id") int? addressId,
      @JsonKey(name: "address_userId") int? addressUserId,
      @JsonKey(name: "address_name") String? addressName,
      @JsonKey(name: "address_city") String? addressCity,
      @JsonKey(name: "address_street") String? addressStreet,
      @JsonKey(name: "address_note") String? addressNote,
      @JsonKey(name: "address_lat") num? addressLat,
      @JsonKey(name: "address_long") num? addressLong,
      @JsonKey(name: "branch_name_ar") String? branchNameAr,
      @JsonKey(name: "branch_name_en") String? branchNameEn,
      @JsonKey(name: "coupon_name") String? couponName,
      @JsonKey(name: "users_name") String? usersName,
      @JsonKey(name: "users_email") String? usersEmail,
      @JsonKey(name: "users_phone") String? usersPhone});
}

/// @nodoc
class __$$OrdersModelImplCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$OrdersModelImpl>
    implements _$$OrdersModelImplCopyWith<$Res> {
  __$$OrdersModelImplCopyWithImpl(
      _$OrdersModelImpl _value, $Res Function(_$OrdersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordersId = freezed,
    Object? ordersUserid = freezed,
    Object? ordersAddress = freezed,
    Object? ordersType = freezed,
    Object? ordersDeliveryFee = freezed,
    Object? ordersPrice = freezed,
    Object? ordersDiscountAmmount = freezed,
    Object? ordersTotalPrice = freezed,
    Object? ordersCoupon = freezed,
    Object? ordersState = freezed,
    Object? ordersTime = freezed,
    Object? ordersRating = freezed,
    Object? ordersPoints = freezed,
    Object? ordersNote = freezed,
    Object? ordersBranch = freezed,
    Object? addressId = freezed,
    Object? addressUserId = freezed,
    Object? addressName = freezed,
    Object? addressCity = freezed,
    Object? addressStreet = freezed,
    Object? addressNote = freezed,
    Object? addressLat = freezed,
    Object? addressLong = freezed,
    Object? branchNameAr = freezed,
    Object? branchNameEn = freezed,
    Object? couponName = freezed,
    Object? usersName = freezed,
    Object? usersEmail = freezed,
    Object? usersPhone = freezed,
  }) {
    return _then(_$OrdersModelImpl(
      ordersId: freezed == ordersId
          ? _value.ordersId
          : ordersId // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersUserid: freezed == ordersUserid
          ? _value.ordersUserid
          : ordersUserid // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersAddress: freezed == ordersAddress
          ? _value.ordersAddress
          : ordersAddress // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersType: freezed == ordersType
          ? _value.ordersType
          : ordersType // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersDeliveryFee: freezed == ordersDeliveryFee
          ? _value.ordersDeliveryFee
          : ordersDeliveryFee // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersPrice: freezed == ordersPrice
          ? _value.ordersPrice
          : ordersPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersDiscountAmmount: freezed == ordersDiscountAmmount
          ? _value.ordersDiscountAmmount
          : ordersDiscountAmmount // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersTotalPrice: freezed == ordersTotalPrice
          ? _value.ordersTotalPrice
          : ordersTotalPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersCoupon: freezed == ordersCoupon
          ? _value.ordersCoupon
          : ordersCoupon // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersState: freezed == ordersState
          ? _value.ordersState
          : ordersState // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersTime: freezed == ordersTime
          ? _value.ordersTime
          : ordersTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ordersRating: freezed == ordersRating
          ? _value.ordersRating
          : ordersRating // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersPoints: freezed == ordersPoints
          ? _value.ordersPoints
          : ordersPoints // ignore: cast_nullable_to_non_nullable
              as num?,
      ordersNote: freezed == ordersNote
          ? _value.ordersNote
          : ordersNote // ignore: cast_nullable_to_non_nullable
              as String?,
      ordersBranch: freezed == ordersBranch
          ? _value.ordersBranch
          : ordersBranch // ignore: cast_nullable_to_non_nullable
              as int?,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      addressUserId: freezed == addressUserId
          ? _value.addressUserId
          : addressUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressCity: freezed == addressCity
          ? _value.addressCity
          : addressCity // ignore: cast_nullable_to_non_nullable
              as String?,
      addressStreet: freezed == addressStreet
          ? _value.addressStreet
          : addressStreet // ignore: cast_nullable_to_non_nullable
              as String?,
      addressNote: freezed == addressNote
          ? _value.addressNote
          : addressNote // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLat: freezed == addressLat
          ? _value.addressLat
          : addressLat // ignore: cast_nullable_to_non_nullable
              as num?,
      addressLong: freezed == addressLong
          ? _value.addressLong
          : addressLong // ignore: cast_nullable_to_non_nullable
              as num?,
      branchNameAr: freezed == branchNameAr
          ? _value.branchNameAr
          : branchNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      branchNameEn: freezed == branchNameEn
          ? _value.branchNameEn
          : branchNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      couponName: freezed == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String?,
      usersName: freezed == usersName
          ? _value.usersName
          : usersName // ignore: cast_nullable_to_non_nullable
              as String?,
      usersEmail: freezed == usersEmail
          ? _value.usersEmail
          : usersEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      usersPhone: freezed == usersPhone
          ? _value.usersPhone
          : usersPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrdersModelImpl implements _OrdersModel {
  const _$OrdersModelImpl(
      {@JsonKey(name: "orders_id") this.ordersId,
      @JsonKey(name: "orders_userid") this.ordersUserid,
      @JsonKey(name: "orders_address") this.ordersAddress,
      @JsonKey(name: "orders_type") this.ordersType,
      @JsonKey(name: "orders_delivery_fee") this.ordersDeliveryFee,
      @JsonKey(name: "orders_price") this.ordersPrice,
      @JsonKey(name: "orders_discount_ammount") this.ordersDiscountAmmount,
      @JsonKey(name: "orders_total_price") this.ordersTotalPrice,
      @JsonKey(name: "orders_coupon") this.ordersCoupon,
      @JsonKey(name: "orders_state") this.ordersState,
      @JsonKey(name: "orders_time") this.ordersTime,
      @JsonKey(name: "orders_rating") this.ordersRating,
      @JsonKey(name: "orders_points") this.ordersPoints,
      @JsonKey(name: "orders_note") this.ordersNote,
      @JsonKey(name: "orders_branch") this.ordersBranch,
      @JsonKey(name: "address_id") this.addressId,
      @JsonKey(name: "address_userId") this.addressUserId,
      @JsonKey(name: "address_name") this.addressName,
      @JsonKey(name: "address_city") this.addressCity,
      @JsonKey(name: "address_street") this.addressStreet,
      @JsonKey(name: "address_note") this.addressNote,
      @JsonKey(name: "address_lat") this.addressLat,
      @JsonKey(name: "address_long") this.addressLong,
      @JsonKey(name: "branch_name_ar") this.branchNameAr,
      @JsonKey(name: "branch_name_en") this.branchNameEn,
      @JsonKey(name: "coupon_name") this.couponName,
      @JsonKey(name: "users_name") this.usersName,
      @JsonKey(name: "users_email") this.usersEmail,
      @JsonKey(name: "users_phone") this.usersPhone});

  factory _$OrdersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersModelImplFromJson(json);

  @override
  @JsonKey(name: "orders_id")
  final int? ordersId;
  @override
  @JsonKey(name: "orders_userid")
  final int? ordersUserid;
  @override
  @JsonKey(name: "orders_address")
  final int? ordersAddress;
  @override
  @JsonKey(name: "orders_type")
  final int? ordersType;
  @override
  @JsonKey(name: "orders_delivery_fee")
  final num? ordersDeliveryFee;
  @override
  @JsonKey(name: "orders_price")
  final num? ordersPrice;
  @override
  @JsonKey(name: "orders_discount_ammount")
  final num? ordersDiscountAmmount;
  @override
  @JsonKey(name: "orders_total_price")
  final num? ordersTotalPrice;
  @override
  @JsonKey(name: "orders_coupon")
  final int? ordersCoupon;
  @override
  @JsonKey(name: "orders_state")
  final int? ordersState;
  @override
  @JsonKey(name: "orders_time")
  final DateTime? ordersTime;
  @override
  @JsonKey(name: "orders_rating")
  final num? ordersRating;
  @override
  @JsonKey(name: "orders_points")
  final num? ordersPoints;
  @override
  @JsonKey(name: "orders_note")
  final String? ordersNote;
  @override
  @JsonKey(name: "orders_branch")
  final int? ordersBranch;
  @override
  @JsonKey(name: "address_id")
  final int? addressId;
  @override
  @JsonKey(name: "address_userId")
  final int? addressUserId;
  @override
  @JsonKey(name: "address_name")
  final String? addressName;
  @override
  @JsonKey(name: "address_city")
  final String? addressCity;
  @override
  @JsonKey(name: "address_street")
  final String? addressStreet;
  @override
  @JsonKey(name: "address_note")
  final String? addressNote;
  @override
  @JsonKey(name: "address_lat")
  final num? addressLat;
  @override
  @JsonKey(name: "address_long")
  final num? addressLong;
  @override
  @JsonKey(name: "branch_name_ar")
  final String? branchNameAr;
  @override
  @JsonKey(name: "branch_name_en")
  final String? branchNameEn;
  @override
  @JsonKey(name: "coupon_name")
  final String? couponName;
  @override
  @JsonKey(name: "users_name")
  final String? usersName;
  @override
  @JsonKey(name: "users_email")
  final String? usersEmail;
  @override
  @JsonKey(name: "users_phone")
  final String? usersPhone;

  @override
  String toString() {
    return 'OrdersModel(ordersId: $ordersId, ordersUserid: $ordersUserid, ordersAddress: $ordersAddress, ordersType: $ordersType, ordersDeliveryFee: $ordersDeliveryFee, ordersPrice: $ordersPrice, ordersDiscountAmmount: $ordersDiscountAmmount, ordersTotalPrice: $ordersTotalPrice, ordersCoupon: $ordersCoupon, ordersState: $ordersState, ordersTime: $ordersTime, ordersRating: $ordersRating, ordersPoints: $ordersPoints, ordersNote: $ordersNote, ordersBranch: $ordersBranch, addressId: $addressId, addressUserId: $addressUserId, addressName: $addressName, addressCity: $addressCity, addressStreet: $addressStreet, addressNote: $addressNote, addressLat: $addressLat, addressLong: $addressLong, branchNameAr: $branchNameAr, branchNameEn: $branchNameEn, couponName: $couponName, usersName: $usersName, usersEmail: $usersEmail, usersPhone: $usersPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersModelImpl &&
            (identical(other.ordersId, ordersId) ||
                other.ordersId == ordersId) &&
            (identical(other.ordersUserid, ordersUserid) ||
                other.ordersUserid == ordersUserid) &&
            (identical(other.ordersAddress, ordersAddress) ||
                other.ordersAddress == ordersAddress) &&
            (identical(other.ordersType, ordersType) ||
                other.ordersType == ordersType) &&
            (identical(other.ordersDeliveryFee, ordersDeliveryFee) ||
                other.ordersDeliveryFee == ordersDeliveryFee) &&
            (identical(other.ordersPrice, ordersPrice) ||
                other.ordersPrice == ordersPrice) &&
            (identical(other.ordersDiscountAmmount, ordersDiscountAmmount) ||
                other.ordersDiscountAmmount == ordersDiscountAmmount) &&
            (identical(other.ordersTotalPrice, ordersTotalPrice) ||
                other.ordersTotalPrice == ordersTotalPrice) &&
            (identical(other.ordersCoupon, ordersCoupon) ||
                other.ordersCoupon == ordersCoupon) &&
            (identical(other.ordersState, ordersState) ||
                other.ordersState == ordersState) &&
            (identical(other.ordersTime, ordersTime) ||
                other.ordersTime == ordersTime) &&
            (identical(other.ordersRating, ordersRating) ||
                other.ordersRating == ordersRating) &&
            (identical(other.ordersPoints, ordersPoints) ||
                other.ordersPoints == ordersPoints) &&
            (identical(other.ordersNote, ordersNote) ||
                other.ordersNote == ordersNote) &&
            (identical(other.ordersBranch, ordersBranch) ||
                other.ordersBranch == ordersBranch) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.addressUserId, addressUserId) ||
                other.addressUserId == addressUserId) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.addressCity, addressCity) ||
                other.addressCity == addressCity) &&
            (identical(other.addressStreet, addressStreet) ||
                other.addressStreet == addressStreet) &&
            (identical(other.addressNote, addressNote) ||
                other.addressNote == addressNote) &&
            (identical(other.addressLat, addressLat) ||
                other.addressLat == addressLat) &&
            (identical(other.addressLong, addressLong) ||
                other.addressLong == addressLong) &&
            (identical(other.branchNameAr, branchNameAr) ||
                other.branchNameAr == branchNameAr) &&
            (identical(other.branchNameEn, branchNameEn) ||
                other.branchNameEn == branchNameEn) &&
            (identical(other.couponName, couponName) ||
                other.couponName == couponName) &&
            (identical(other.usersName, usersName) ||
                other.usersName == usersName) &&
            (identical(other.usersEmail, usersEmail) ||
                other.usersEmail == usersEmail) &&
            (identical(other.usersPhone, usersPhone) ||
                other.usersPhone == usersPhone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        ordersId,
        ordersUserid,
        ordersAddress,
        ordersType,
        ordersDeliveryFee,
        ordersPrice,
        ordersDiscountAmmount,
        ordersTotalPrice,
        ordersCoupon,
        ordersState,
        ordersTime,
        ordersRating,
        ordersPoints,
        ordersNote,
        ordersBranch,
        addressId,
        addressUserId,
        addressName,
        addressCity,
        addressStreet,
        addressNote,
        addressLat,
        addressLong,
        branchNameAr,
        branchNameEn,
        couponName,
        usersName,
        usersEmail,
        usersPhone
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      __$$OrdersModelImplCopyWithImpl<_$OrdersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersModelImplToJson(
      this,
    );
  }
}

abstract class _OrdersModel implements OrdersModel {
  const factory _OrdersModel(
          {@JsonKey(name: "orders_id") final int? ordersId,
          @JsonKey(name: "orders_userid") final int? ordersUserid,
          @JsonKey(name: "orders_address") final int? ordersAddress,
          @JsonKey(name: "orders_type") final int? ordersType,
          @JsonKey(name: "orders_delivery_fee") final num? ordersDeliveryFee,
          @JsonKey(name: "orders_price") final num? ordersPrice,
          @JsonKey(name: "orders_discount_ammount")
          final num? ordersDiscountAmmount,
          @JsonKey(name: "orders_total_price") final num? ordersTotalPrice,
          @JsonKey(name: "orders_coupon") final int? ordersCoupon,
          @JsonKey(name: "orders_state") final int? ordersState,
          @JsonKey(name: "orders_time") final DateTime? ordersTime,
          @JsonKey(name: "orders_rating") final num? ordersRating,
          @JsonKey(name: "orders_points") final num? ordersPoints,
          @JsonKey(name: "orders_note") final String? ordersNote,
          @JsonKey(name: "orders_branch") final int? ordersBranch,
          @JsonKey(name: "address_id") final int? addressId,
          @JsonKey(name: "address_userId") final int? addressUserId,
          @JsonKey(name: "address_name") final String? addressName,
          @JsonKey(name: "address_city") final String? addressCity,
          @JsonKey(name: "address_street") final String? addressStreet,
          @JsonKey(name: "address_note") final String? addressNote,
          @JsonKey(name: "address_lat") final num? addressLat,
          @JsonKey(name: "address_long") final num? addressLong,
          @JsonKey(name: "branch_name_ar") final String? branchNameAr,
          @JsonKey(name: "branch_name_en") final String? branchNameEn,
          @JsonKey(name: "coupon_name") final String? couponName,
          @JsonKey(name: "users_name") final String? usersName,
          @JsonKey(name: "users_email") final String? usersEmail,
          @JsonKey(name: "users_phone") final String? usersPhone}) =
      _$OrdersModelImpl;

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$OrdersModelImpl.fromJson;

  @override
  @JsonKey(name: "orders_id")
  int? get ordersId;
  @override
  @JsonKey(name: "orders_userid")
  int? get ordersUserid;
  @override
  @JsonKey(name: "orders_address")
  int? get ordersAddress;
  @override
  @JsonKey(name: "orders_type")
  int? get ordersType;
  @override
  @JsonKey(name: "orders_delivery_fee")
  num? get ordersDeliveryFee;
  @override
  @JsonKey(name: "orders_price")
  num? get ordersPrice;
  @override
  @JsonKey(name: "orders_discount_ammount")
  num? get ordersDiscountAmmount;
  @override
  @JsonKey(name: "orders_total_price")
  num? get ordersTotalPrice;
  @override
  @JsonKey(name: "orders_coupon")
  int? get ordersCoupon;
  @override
  @JsonKey(name: "orders_state")
  int? get ordersState;
  @override
  @JsonKey(name: "orders_time")
  DateTime? get ordersTime;
  @override
  @JsonKey(name: "orders_rating")
  num? get ordersRating;
  @override
  @JsonKey(name: "orders_points")
  num? get ordersPoints;
  @override
  @JsonKey(name: "orders_note")
  String? get ordersNote;
  @override
  @JsonKey(name: "orders_branch")
  int? get ordersBranch;
  @override
  @JsonKey(name: "address_id")
  int? get addressId;
  @override
  @JsonKey(name: "address_userId")
  int? get addressUserId;
  @override
  @JsonKey(name: "address_name")
  String? get addressName;
  @override
  @JsonKey(name: "address_city")
  String? get addressCity;
  @override
  @JsonKey(name: "address_street")
  String? get addressStreet;
  @override
  @JsonKey(name: "address_note")
  String? get addressNote;
  @override
  @JsonKey(name: "address_lat")
  num? get addressLat;
  @override
  @JsonKey(name: "address_long")
  num? get addressLong;
  @override
  @JsonKey(name: "branch_name_ar")
  String? get branchNameAr;
  @override
  @JsonKey(name: "branch_name_en")
  String? get branchNameEn;
  @override
  @JsonKey(name: "coupon_name")
  String? get couponName;
  @override
  @JsonKey(name: "users_name")
  String? get usersName;
  @override
  @JsonKey(name: "users_email")
  String? get usersEmail;
  @override
  @JsonKey(name: "users_phone")
  String? get usersPhone;
  @override
  @JsonKey(ignore: true)
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
