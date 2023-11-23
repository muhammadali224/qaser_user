import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/user_model/user_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../firebase_options.dart';
import '../constant/get_box_key.dart';

class MyServices extends GetxService {
  late GetStorage getBox;
  String? deviceId;
  late FirebaseMessaging fireMessaging;

  Future<MyServices> init() async {
    await GetStorage.init();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    getBox = GetStorage();

    await dotenv.load(fileName: ".env");

    var deviceInfo = DeviceInfoPlugin();
    var androidDeviceInfo = await deviceInfo.androidInfo;
    fireMessaging = FirebaseMessaging.instance;
    try {
      if (getBox.read(GetBoxKey.user) == null) {
        user = UserModel(
          usersApprove: 0,
          usersName: "user",
          usersPhone: androidDeviceInfo.id,
          usersEmail: androidDeviceInfo.id,
          usersImage: "user.png",
          usersPassword: androidDeviceInfo.id,
          usersIsAnonymous: 1,
        );
        await getBox.write(GetBoxKey.user, user.toJson());
      } else {
        // var res = jsonEncode(await getBox.read(GetBoxKey.user));
        // print(res.runtimeType);
        // print(res);
        // var res2 = jsonDecode(res);
        // print(res2.runtimeType);
        // print(res2);
        user = UserModel.fromJson(
            jsonDecode(jsonEncode(await getBox.read(GetBoxKey.user))));
        // user =
        //     jsonEncode(await getBox.read(GetBoxKey.user));
      }
    } catch (e) {
      throw Exception(e);
    }

    if (getBox.read(GetBoxKey.isSigned) == false ||
        getBox.read(GetBoxKey.isSigned) == null) {
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("notSigned");
      fireMessaging.unsubscribeFromTopic("signed");
    } else {
      fireMessaging.unsubscribeFromTopic("notSigned");
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("signed");
    }

    FirebaseAnalytics.instance;

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
