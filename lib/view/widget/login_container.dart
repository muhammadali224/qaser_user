import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText("loginMessage".tr),
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.login),
          child: AutoSizeText(
            'goToLogin'.tr,
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
