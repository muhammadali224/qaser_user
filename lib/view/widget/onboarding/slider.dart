import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/source/static/static.dart';

class SliderOnboarding extends GetView<OnBoardingControllerImp> {
  const SliderOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Lottie.asset(onboardingList[i].image!,
                    height: Get.width / 1.2, fit: BoxFit.fill),
                const SizedBox(height: 60),
                Text(onboardingList[i].title!,
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(onboardingList[i].body!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge)),
              ],
            ));
  }
}
