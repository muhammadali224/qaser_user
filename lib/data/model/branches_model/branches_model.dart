// To parse this JSON data, do
//
//     final branchesModel = branchesModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branches_model.freezed.dart';
part 'branches_model.g.dart';

BranchesModel branchesModelFromJson(String str) =>
    BranchesModel.fromJson(json.decode(str));

String branchesModelToJson(BranchesModel data) => json.encode(data.toJson());

@freezed
class BranchesModel with _$BranchesModel {
  const factory BranchesModel({
    @JsonKey(name: "branch_id") int? branchId,
    @JsonKey(name: "branch_name_ar") String? branchNameAr,
    @JsonKey(name: "branch_name_en") String? branchNameEn,
    @JsonKey(name: "branch_is_open") int? branchIsOpen,
    @JsonKey(name: "branch_lang") double? branchLang,
    @JsonKey(name: "branch_lat") double? branchLat,
    @JsonKey(name: "branch_phone1") String? branchPhone1,
    @JsonKey(name: "branch_phone2") String? branchPhone2,
    @JsonKey(name: "branch_facebook_url") String? branchFacebookUrl,
    @JsonKey(name: "branch_start_delivery") num? branchStartDelivery,
    @JsonKey(name: "branch_delivery_charge") num? branchDeliveryCharge,
    @JsonKey(name: "branch_isFixed") int? branchIsFixed,
    @JsonKey(name: "branch_zone") num? branchZone,
    @JsonKey(name: "branch_delivery_fix_charge") num? branchDeliveryFixCharge,
    @JsonKey(name: "branch_max_zone") num? branchMaxZone,
  }) = _BranchesModel;

  factory BranchesModel.fromJson(Map<String, dynamic> json) =>
      _$BranchesModelFromJson(json);
}
