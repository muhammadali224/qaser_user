import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/app.service.dart';
import 'routes.dart';

var deviceInfo = DeviceInfoPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      navigatorKey: Get.key,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        GetObserver(),
      ],
      enableLog: true,
      popGesture: Get.isPopGestureEnable,
      defaultTransition: Transition.cupertino,
      builder: FlutterSmartDialog.init(),
      translations: MyTranslation(),
      locale: controller.initLanguages,
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Application',
      theme: controller.appTheme,
      initialBinding: InitBindings(),
      getPages: routes,
    );
  }
}
