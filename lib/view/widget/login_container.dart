import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: RichText(
          text: TextSpan(
              text: "loginMessage".tr,
              style: DefaultTextStyle.of(context).style,
              children: [
            WidgetSpan(
                child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.login),
              child: Text(
                'goToLogin'.tr,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )),
          ])),
    );
  }
}
