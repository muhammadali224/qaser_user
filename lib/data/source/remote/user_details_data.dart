import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class UserDetailsData {
  CRUD crud;

  UserDetailsData(this.crud);

  getUserData(int id) async {
    var response =
        await crud.postData(AppLink.getUserDetails, {'id': id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  changeUserPassword(int id, String password, String oldPassword) async {
    var response = await crud.postData(AppLink.changePassword, {
      'id': id.toString(),
      'password': password,
      'oldPassword': oldPassword,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserName(int id, String userName) async {
    var response = await crud.postData(AppLink.changeUserName, {
      'id': id.toString(),
      'userName': userName,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeUserPhone(int id, String phone) async {
    var response = await crud.postData(AppLink.changePhone, {
      'id': id.toString(),
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

  deleteUserImage(int id, String imageName) async {
    var response = await crud.postData(
        AppLink.deleteImage, {'id': id.toString(), 'image_name': imageName});
    return response.fold((l) => l, (r) => r);
  }

  verifyCode(int id, String email, String oldEmail, int verifyCode) async {
    var response = await crud.postData(AppLink.verifyChangedEmail, {
      'id': id.toString(),
      'email': email,
      'oldEmail': oldEmail,
      'verifyCode': verifyCode.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  resendVerify(String email) async {
    var response = await crud.postData(AppLink.resendVerify, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkEmail(int id, String email) async {
    var response = await crud.postData(AppLink.checkChangedEmail, {
      'id': id.toString(),
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
