import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';

class NoResultSearch extends StatelessWidget {
  const NoResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Assets.lottieNoSearch, height: 250, width: 250),
                Text("noResult".tr,
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ))),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "backToHome".tr,
                    style: const TextStyle(fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
