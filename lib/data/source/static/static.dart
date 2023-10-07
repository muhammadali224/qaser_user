import 'package:get/get.dart';

import '../../../core/constant/image_assets.dart';
import '../../model/onboarding_model.dart';

List<OnBoardingModel> onboardingList = [
  OnBoardingModel(
      title: 'Choose Product'.tr,
      body: 'Choose Product Body'.tr,
      image: AppImageAssets.imagesOne),
  OnBoardingModel(
      title: 'Easy & Safe Payment'.tr,
      body: 'Easy & Safe Payment Body'.tr,
      image: AppImageAssets.imagesTwo),
  OnBoardingModel(
      title: 'Track your Order'.tr,
      body: 'Track your Order Body'.tr,
      image: AppImageAssets.imagesThree),
  // OnBoardingModel(
  //     title: 'Fast Delivery',
  //     body:
  //         'Reliable And Fast Delivery, We\nDeliver your order the fastest\nway possible.',
  //     image: AppImageAssets.onboardingFour),
];
