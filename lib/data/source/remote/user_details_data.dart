import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class UserDetailsData {
  CRUD crud;

  UserDetailsData(this.crud);

  getUserData(String id) async {
    var response = await crud.postData(AppLink.getUserDetails, {'id': id});
    return response.fold((l) => l, (r) => r);
  }

  changeUserPassword(String id, String password, String oldPassword) async {
    var response = await crud.postData(AppLink.changePassword, {
      'id': id,
      'password': password,
      'oldPassword': oldPassword,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserName(String id, String userName) async {
    var response = await crud.postData(AppLink.changeUserName, {
      'id': id,
      'userName': userName,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserPhone(String id, String phone) async {
    var response = await crud.postData(AppLink.changePhone, {
      'id': id,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserImage(Map data, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.changeImage,
      data,
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteUserImage(String id, String imageName) async {
    var response = await crud
        .postData(AppLink.deleteImage, {'id': id, 'image_name': imageName});
    return response.fold((l) => l, (r) => r);
  }

  verifyCode(
      String id, String email, String oldEmail, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyChangedEmail, {
      'id': id,
      'email': email,
      'oldEmail': oldEmail,
      'verifyCode': verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendVerify(String email) async {
    var response = await crud.postData(AppLink.resendVerify, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkEmail(String id, String email) async {
    var response = await crud.postData(AppLink.checkChangedEmail, {
      'id': id,
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
