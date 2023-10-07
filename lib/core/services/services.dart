import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance;
    sharedPref = await SharedPreferences.getInstance();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
