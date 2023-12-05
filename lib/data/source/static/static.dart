import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../model/onboarding_model.dart';

List<OnBoardingModel> onboardingList = [
  OnBoardingModel(
      title: 'Choose Product'.tr,
      body: 'Choose Product Body'.tr,
      image: Assets.lottieOnboard1),
  OnBoardingModel(
      title: 'Easy & Safe Payment'.tr,
      body: 'Easy & Safe Payment Body'.tr,
      image: Assets.lottieOnboard2),
  OnBoardingModel(
      title: 'Track your Order'.tr,
      body: 'Track your Order Body'.tr,
      image: Assets.lottieOnboard3),
  // OnBoardingModel(
  //     title: 'Fast Delivery',
  //     body:
  //         'Reliable And Fast Delivery, We\nDeliver your order the fastest\nway possible.',
  //     image: AppImageAssets.onboardingFour),
];
