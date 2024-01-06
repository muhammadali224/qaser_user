// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "users_id") int? usersId,
    @JsonKey(name: "users_name") String? usersName,
    @JsonKey(name: "users_email") String? usersEmail,
    @JsonKey(name: "users_password") String? usersPassword,
    @JsonKey(name: "users_phone") String? usersPhone,
    @JsonKey(name: "users_image") String? usersImage,
    @JsonKey(name: "users_verifycode") int? usersVerifycode,
    @JsonKey(name: "users_approve") int? usersApprove,
    @JsonKey(name: "users_create") DateTime? usersCreate,
    @JsonKey(name: "user_fav_branch_id") int? userFavBranchId,
    @JsonKey(name: "users_is_Anonymous") int? usersIsAnonymous,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
