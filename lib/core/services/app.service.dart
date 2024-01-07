import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../firebase_options.dart';
import '../../main.dart';
import '../constant/get_box_key.dart';
import 'awesome_helper.service.dart';
import 'fcm_helper.service.dart';

class MyServices extends GetxService {
  GetStorage getBox = GetStorage();
  String? deviceId;
  late AndroidDeviceInfo androidDeviceInfo;
  late FirebaseMessaging fireMessaging;

  Future<MyServices> init() async {
    await GetStorage.init();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    await dotenv.load(fileName: ".env");
    androidDeviceInfo = await deviceInfo.androidInfo;

    await FcmHelper.initFcm();
    await AwesomeNotificationsHelper.init();
    fireMessaging = FirebaseMessaging.instance;

    if (getBox.read(GetBoxKey.isSigned) != true) {
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("notSigned");
      fireMessaging.unsubscribeFromTopic("signed");
    } else {
      fireMessaging.unsubscribeFromTopic("notSigned");
      fireMessaging.subscribeToTopic("all");
      fireMessaging.subscribeToTopic("signed");
    }

    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
