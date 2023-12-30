import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/onboarding/custom_button.dart';
import '../../widget/onboarding/dots_controller.dart';
import '../../widget/onboarding/slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(flex: 4, child: SliderOnboarding()),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotsController(),
                    Spacer(flex: 2),
                    CustomButtonOnboarding(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
