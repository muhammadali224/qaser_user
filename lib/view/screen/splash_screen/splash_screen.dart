import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qaser_user/generated/assets.dart';

import '../../../controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      extendBody: true,
      body: Column(
        // alignment: Alignment.bottomCenter,
        children: [
          // Image.asset(
          //   Assets.imagesSplash,
          //   fit: BoxFit.fill,
          //   height: Get.height,
          //   width: Get.width,
          // ),

          Lottie.asset(
            Assets.lottieSplash,
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          // Positioned(
          //   bottom: 20,
          //   child: Center(child: CircularProgressIndicator()),
          // ),
        ],
      ),
    );
  }
}
