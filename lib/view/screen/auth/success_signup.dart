import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/auth_controller/success_signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image_assets.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/body_text.dart';
import '../../widget/auth/herder_text.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImpl controller =
        Get.put(SuccessSignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "success".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Lottie.asset(AppImageAssets.accountCreated,
                  height: 300, fit: BoxFit.fill),
            ),
            const CustomHeader(headerText: 'cong'),
            const SizedBox(height: 10),
            CustomBody(
                bodyText: '${'successSignup'.tr} \n ${controller.email}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomAuthButton(
                text: 'successSignupButton',
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
