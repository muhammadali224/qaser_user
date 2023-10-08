import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';

class SuccessCoupon extends StatelessWidget {
  final String couponName;
  const SuccessCoupon({super.key, required this.couponName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${'couponSuccess'.tr} "),
          Row(
            children: [
              Text(couponName),
              Lottie.asset(Assets.lottieSuccess,
                  height: 35, width: 40, repeat: false),
            ],
          )
        ],
      ),
    );
  }
}
