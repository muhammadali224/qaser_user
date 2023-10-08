import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/forget_password_controller/success_reset_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../generated/assets.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/body_text.dart';
import '../../../widget/auth/herder_text.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImpl controller =
        Get.put(SuccessResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconBroken.Arrow___Right_2,
            size: 30,
          ),
        ),
        elevation: 0.0,
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
              child: Lottie.asset(Assets.lottieAccountCreated,
                  height: 300, fit: BoxFit.cover),
            ),
            const CustomHeader(headerText: 'cong'),
            const SizedBox(height: 10),
            CustomBody(
                bodyText: '${'successReset'.tr} of\n ${controller.email}'),
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
