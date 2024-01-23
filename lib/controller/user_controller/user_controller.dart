// ignore_for_file: file_names

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/constant/get_box_key.dart';
import '../../data/model/user_model/user_model.dart';
import '../../main.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel = const UserModel().obs;

  final _box = GetStorage();

  UserModel get user {
    try {
      final userData = _box.read(GetBoxKey.user);

      if (userData != null) {
        _userModel.value = UserModel.fromJson(userData);

        print('User loaded from storage: $userData');
      } else {
        _setDefaultUserData();

        print('No user data found in storage');
      }
      return _userModel.value;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  set user(UserModel value) {
    _userModel.value = value;
    saveUserToStorage(value);
  }

  UserController() {
    user;
  }

  Future<void> saveUserToStorage(UserModel user) async {
    try {
      await _box.write(GetBoxKey.user, user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void readUserFromStorage() async {
    try {
      final userData = _box.read(GetBoxKey.user);
      if (userData != null) {
        _userModel.value = UserModel.fromJson(userData);
        print('User read from storage: $userData');
      } else {
        await _setDefaultUserData();
        print('No user data found in storage.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _setDefaultUserData() async {
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
      usersImage: "new_user.png",
    );
    await saveUserToStorage(_userModel.value);
  }

  Future<void> clear() async {
    await _box.remove(GetBoxKey.user);
    _userModel.value = const UserModel();
  }
}
