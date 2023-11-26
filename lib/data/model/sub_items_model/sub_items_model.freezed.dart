// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubItemsModel _$SubItemsModelFromJson(Map<String, dynamic> json) {
  return _SubItemsModel.fromJson(json);
}

/// @nodoc
mixin _$SubItemsModel {
  @JsonKey(name: "weight_size_id")
  int? get weightSizeId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_name")
  String? get subItemName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_name_ar")
  String? get subItemNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_value")
  num? get subItemValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubItemsModelCopyWith<SubItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubItemsModelCopyWith<$Res> {
  factory $SubItemsModelCopyWith(
          SubItemsModel value, $Res Function(SubItemsModel) then) =
      _$SubItemsModelCopyWithImpl<$Res, SubItemsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "weight_size_id") int? weightSizeId,
      @JsonKey(name: "sub_item_name") String? subItemName,
      @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
      @JsonKey(name: "sub_item_value") num? subItemValue});
}

/// @nodoc
class _$SubItemsModelCopyWithImpl<$Res, $Val extends SubItemsModel>
    implements $SubItemsModelCopyWith<$Res> {
  _$SubItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weightSizeId = freezed,
    Object? subItemName = freezed,
    Object? subItemNameAr = freezed,
    Object? subItemValue = freezed,
  }) {
    return _then(_value.copyWith(
      weightSizeId: freezed == weightSizeId
          ? _value.weightSizeId
          : weightSizeId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemName: freezed == subItemName
          ? _value.subItemName
          : subItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemNameAr: freezed == subItemNameAr
          ? _value.subItemNameAr
          : subItemNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemValue: freezed == subItemValue
          ? _value.subItemValue
          : subItemValue // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubItemsModelImplCopyWith<$Res>
    implements $SubItemsModelCopyWith<$Res> {
  factory _$$SubItemsModelImplCopyWith(
          _$SubItemsModelImpl value, $Res Function(_$SubItemsModelImpl) then) =
      __$$SubItemsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "weight_size_id") int? weightSizeId,
      @JsonKey(name: "sub_item_name") String? subItemName,
      @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
      @JsonKey(name: "sub_item_value") num? subItemValue});
}

/// @nodoc
class __$$SubItemsModelImplCopyWithImpl<$Res>
    extends _$SubItemsModelCopyWithImpl<$Res, _$SubItemsModelImpl>
    implements _$$SubItemsModelImplCopyWith<$Res> {
  __$$SubItemsModelImplCopyWithImpl(
      _$SubItemsModelImpl _value, $Res Function(_$SubItemsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weightSizeId = freezed,
    Object? subItemName = freezed,
    Object? subItemNameAr = freezed,
    Object? subItemValue = freezed,
  }) {
    return _then(_$SubItemsModelImpl(
      weightSizeId: freezed == weightSizeId
          ? _value.weightSizeId
          : weightSizeId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemName: freezed == subItemName
          ? _value.subItemName
          : subItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemNameAr: freezed == subItemNameAr
          ? _value.subItemNameAr
          : subItemNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemValue: freezed == subItemValue
          ? _value.subItemValue
          : subItemValue // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubItemsModelImpl implements _SubItemsModel {
  const _$SubItemsModelImpl(
      {@JsonKey(name: "weight_size_id") this.weightSizeId,
      @JsonKey(name: "sub_item_name") this.subItemName,
      @JsonKey(name: "sub_item_name_ar") this.subItemNameAr,
      @JsonKey(name: "sub_item_value") this.subItemValue});

  factory _$SubItemsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubItemsModelImplFromJson(json);

  @override
  @JsonKey(name: "weight_size_id")
  final int? weightSizeId;
  @override
  @JsonKey(name: "sub_item_name")
  final String? subItemName;
  @override
  @JsonKey(name: "sub_item_name_ar")
  final String? subItemNameAr;
  @override
  @JsonKey(name: "sub_item_value")
  final num? subItemValue;

  @override
  String toString() {
    return 'SubItemsModel(weightSizeId: $weightSizeId, subItemName: $subItemName, subItemNameAr: $subItemNameAr, subItemValue: $subItemValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubItemsModelImpl &&
            (identical(other.weightSizeId, weightSizeId) ||
                other.weightSizeId == weightSizeId) &&
            (identical(other.subItemName, subItemName) ||
                other.subItemName == subItemName) &&
            (identical(other.subItemNameAr, subItemNameAr) ||
                other.subItemNameAr == subItemNameAr) &&
            (identical(other.subItemValue, subItemValue) ||
                other.subItemValue == subItemValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, weightSizeId, subItemName, subItemNameAr, subItemValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubItemsModelImplCopyWith<_$SubItemsModelImpl> get copyWith =>
      __$$SubItemsModelImplCopyWithImpl<_$SubItemsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubItemsModelImplToJson(
      this,
    );
  }
}

abstract class _SubItemsModel implements SubItemsModel {
  const factory _SubItemsModel(
          {@JsonKey(name: "weight_size_id") final int? weightSizeId,
          @JsonKey(name: "sub_item_name") final String? subItemName,
          @JsonKey(name: "sub_item_name_ar") final String? subItemNameAr,
          @JsonKey(name: "sub_item_value") final num? subItemValue}) =
      _$SubItemsModelImpl;

  factory _SubItemsModel.fromJson(Map<String, dynamic> json) =
      _$SubItemsModelImpl.fromJson;

  @override
  @JsonKey(name: "weight_size_id")
  int? get weightSizeId;
  @override
  @JsonKey(name: "sub_item_name")
  String? get subItemName;
  @override
  @JsonKey(name: "sub_item_name_ar")
  String? get subItemNameAr;
  @override
  @JsonKey(name: "sub_item_value")
  num? get subItemValue;
  @override
  @JsonKey(ignore: true)
  _$$SubItemsModelImplCopyWith<_$SubItemsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
