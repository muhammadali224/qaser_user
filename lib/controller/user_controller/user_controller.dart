// ignore_for_file: file_names

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';

import '../../data/model/user_model/user_model.dart';
import '../../main.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel = UserModel().obs;
  final _box = GetStorage();

  UserModel get user {
    final userData = _box.read(GetBoxKey.user);
    print("User Data :$userData");
    if (userData != null) {
      _userModel.value = userModelFromJson(userData);
      print('User loaded from storage: $userData');
    } else {
      _setDefaultUserData();
      print('No user data found in storage. Setting default user.');
    }
    return _userModel.value;
  }

  set user(UserModel value) {
    _userModel.value = value;
    saveUserToStorage(value);
  }

  UserController() {
    user;
  }

  void _setDefaultUserData() async {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    _userModel.value = UserModel(
      usersName: androidDeviceInfo.type,
      usersEmail: androidDeviceInfo.id,
      usersPassword: androidDeviceInfo.serialNumber,
      usersApprove: 1,
      usersIsAnonymous: 1,
      usersPhone: androidDeviceInfo.serialNumber,
      usersVerifycode: 0000,
      userFavBranchId: 1,
      usersImage: "user.png",
    );
  }

  void saveUserToStorage(UserModel user) {
    _box.write(GetBoxKey.user, userModelToJson(user));
    print('User saved to storage: ${_box.read('user')}');
  }

  void readUserFromStorage() {
    final userData = _box.read(GetBoxKey.user);

    if (userData != null) {
      _userModel.value = userModelFromJson(userData);
      print('User read from storage: $userData');
    } else {
      _setDefaultUserData();
      print('No user data found in storage.');
    }
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
