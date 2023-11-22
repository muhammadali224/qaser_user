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
    if (getBox.read(GetBoxKey.isSigned) == false ||
        getBox.read(GetBoxKey.isSigned) == null) {
      user = UserModel(
        usersApprove: 0,
        usersName: "user",
        usersPhone: androidDeviceInfo.id,
        usersEmail: androidDeviceInfo.id,
        usersImage: "user.png",
        usersPassword: androidDeviceInfo.id,
        usersIsAnonymous: 1,
      );
      getBox.write(GetBoxKey.user, user.toJson());
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("notSigned");
      fireMessaging.unsubscribeFromTopic("signed");
    } else {
      user = UserModel.fromJson(getBox.read(GetBoxKey.user));
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
