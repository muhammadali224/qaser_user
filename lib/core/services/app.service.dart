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
import 'awesome_helper.service.dart';
import 'fcm_helper.service.dart';

class MyServices extends GetxService {
  late GetStorage getBox;
  String? deviceId;
  late AndroidDeviceInfo androidDeviceInfo;
  late FirebaseMessaging fireMessaging;

  Future<MyServices> init() async {
    await GetStorage.init();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    getBox = GetStorage();

    await dotenv.load(fileName: ".env");
    var deviceInfo = DeviceInfoPlugin();
    androidDeviceInfo = await deviceInfo.androidInfo;
    // getBox.erase();
    fireMessaging = FirebaseMessaging.instance;
    try {
      if (getBox.read(GetBoxKey.user) != null) {
        user = userModelFromJson(await getBox.read(GetBoxKey.user));
      }
    } catch (e) {
      throw Exception(e);
    }

    if (getBox.read(GetBoxKey.isSigned) != true) {
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("notSigned");
      fireMessaging.unsubscribeFromTopic("signed");
    } else {
      fireMessaging.unsubscribeFromTopic("notSigned");
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("signed");
    }

    FirebaseAnalytics.instance;
    await FcmHelper.initFcm();
    await AwesomeNotificationsHelper.init();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
