import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/localization/change_local.dart';
import '../widget/language/languages_button.dart';

class LanguageScreen extends GetView<LocalController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("chooseLang".tr,
                style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
            LanguagesButton(
              title: 'العربية',
              onPressed: () {
                controller.changeLanguage('ar');
                Get.offNamed(AppRoutes.onBoarding);
                // Get.offNamed(AppRoutes.login);
              },
            ),
            LanguagesButton(
              title: 'English',
              onPressed: () {
                controller.changeLanguage('en');
                Get.offNamed(AppRoutes.onBoarding);
                // Get.offNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
