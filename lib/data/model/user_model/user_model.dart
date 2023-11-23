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

// class UserModel {
//   int? usersId;
//   String? usersName;
//   String? usersEmail;
//   String? usersPassword;
//   String? usersPhone;
//   String? usersImage;
//   int? usersVerifycode;
//   int? usersApprove;
//   String? usersCreate;
//   int? userFavBranchId;
//   int? usersIsAnonymous;
//
//   UserModel(
//       {this.usersId,
//       this.usersName,
//       this.usersEmail,
//       this.usersPassword,
//       this.usersPhone,
//       this.usersImage,
//       this.usersVerifycode,
//       this.usersApprove,
//       this.usersCreate,
//       this.userFavBranchId,
//       this.usersIsAnonymous});
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     usersId = json['users_id'];
//     usersName = json['users_name'];
//     usersEmail = json['users_email'];
//     usersPassword = json['users_password'];
//     usersPhone = json['users_phone'];
//     usersImage = json['users_image'];
//     usersVerifycode = json['users_verifycode'];
//     usersApprove = json['users_approve'];
//     usersCreate = json['users_create'];
//     userFavBranchId = json['user_fav_branch_id'];
//     usersIsAnonymous = json['users_is_Anonymous'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['users_id'] = this.usersId;
//     data['users_name'] = this.usersName;
//     data['users_email'] = this.usersEmail;
//     data['users_password'] = this.usersPassword;
//     data['users_phone'] = this.usersPhone;
//     data['users_image'] = this.usersImage;
//     data['users_verifycode'] = this.usersVerifycode;
//     data['users_approve'] = this.usersApprove;
//     data['users_create'] = this.usersCreate;
//     data['user_fav_branch_id'] = this.userFavBranchId;
//     data['users_is_Anonymous'] = this.usersIsAnonymous;
//     return data;
//   }
// }
