import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnboarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: AppColor.primaryColor,
        child: Text("continue".tr),
      ),
    );
  }
}
