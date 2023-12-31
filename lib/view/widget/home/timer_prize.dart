import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../../controller/home_controller/timer_controller.dart';
import '../bottom_cart_button.dart';

class TimerPrize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(TimerController());
    return GetBuilder<TimerController>(builder: (controller) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Visibility(
                visible: controller.secondsRemaining.value <= 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ButtomNavigatButton(
                    onPressed: () async {
                      controller.secondsRemaining.value =
                          controller.totalSeconds;
                      controller.startTimer();
                    },
                    color: Colors.red,
                    title: 'getPrize',
                    icon: FontAwesome.award_solid,
                    iconColor: Colors.amber,
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
              return Obx(() {
                return Visibility(
                  visible: controller.secondsRemaining.value > 0,
                  child: Text(
                    '${"prizeAfter".tr} : ${controller.getEta()}'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              });
            }),
          ],
        ),
      );
    });
  }
}
