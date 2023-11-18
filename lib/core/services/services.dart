import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;
  late FirebaseAuth fireAuth;
  late FirebaseMessaging fireMessaging;
  User? fireUser;

  Future<MyServices> init() async {
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseAnalytics.instance;
    fireAuth = FirebaseAuth.instance;
    fireMessaging = FirebaseMessaging.instance;
    final credential = await fireAuth.signInAnonymously();
    fireUser = credential.user;
    print(fireUser);
    fireMessaging.subscribeToTopic("all");
    fireMessaging.subscribeToTopic("notSigned");
    sharedPref = await SharedPreferences.getInstance();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
