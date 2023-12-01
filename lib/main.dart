import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/app.service.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
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
