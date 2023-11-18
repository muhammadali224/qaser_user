import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_model/user_model.dart';

class UserPreferences extends GetxService {
  UserModel? _user;

  UserModel get user => _user!;

  set user(UserModel userVal) {
    _user = userVal;
  }

  static const String _userKey = 'user';

  Future<void> setUser(UserModel userVal) async {
    user = userVal;
    await _saveUser(userVal);
  }

  Future<void> clearUser() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Future<void> changeUser(UserModel user) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_userKey, json.encode(user.toJson()));
  // }

  Future<void> _saveUser(UserModel userVal) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = userVal.toJson();
    print(userJson);
    await prefs.setString(_userKey, jsonEncode(userJson));
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    print(userJson);
    if (userJson != null) {
      user = UserModel.fromJson(jsonDecode(userJson));
    }
  }

  Future<void> initUser() async {
    await getUser();
  }

  @override
  void onInit() async {
    await initUser();
    super.onInit();
  }
}
