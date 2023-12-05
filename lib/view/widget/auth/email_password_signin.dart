import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/login_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/valid_input.dart';
import 'auth_button.dart';
import 'custom_auth_input.dart';
import 'logo.dart';

class EmailPasswordSignin extends GetView<LoginControllerImp> {
  const EmailPasswordSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LogoAuth(),
        const SizedBox(height: 20),
        CustomAuthInput(
          labelText: 'email',
          controller: controller.email,
          // isDense: true,
          hintText: 'enterEmail',
          validator: (val) {
            return validInput(val!, 7, 50, 'email');
          },
          icon: Icons.email_outlined,
        ),
        GetBuilder<LoginControllerImp>(
          builder: (controller) => CustomAuthInput(
            controller: controller.password,
            obscureText: controller.isVisiblePassword,
            labelText: 'password',
            hintText: 'enterPassword',
            validator: (val) {
              return validInput(val!, 5, 50, 'password');
            },
            onTapIcon: () => controller.showPassword(),
            onSubmit: (val) {
              controller.login();
            },
            icon: controller.isVisiblePassword
                ? Icons.remove_red_eye
                : Icons.visibility_off_outlined,
          ),
        ),
        InkWell(
          onTap: controller.goToForgetPassword,
          child: Text(
            "forget".tr,
            textAlign: TextAlign.end,
            style: TextStyle(color: AppColor.black),
          ),
        ),
        CustomAuthButton(
          color: Colors.red,
          text: 'signin',
          onPressed: controller.login,
        ),
      ],
    );
  }
}
