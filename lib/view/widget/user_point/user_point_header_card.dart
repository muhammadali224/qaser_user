import 'package:animated_number/animated_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/user_point_controller/user_point_controller.dart';

import '../../../generated/assets.dart';

class PointHeaderCard extends GetView<UserPointController> {
  const PointHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: Get.height / 4,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(double.parse(10.toString())),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white.withOpacity(.1),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 400,
                  backgroundColor: Colors.white.withOpacity(.15),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(Assets.imagesLogo),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedNumber(
                          duration: Duration(seconds: 1),
                          startValue: 0,
                          endValue: controller.totalPoint,
                          isFloatingPoint: false,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "point".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
