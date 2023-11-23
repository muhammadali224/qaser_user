import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forget_password_controller/forget_password_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/function/valid_input.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/body_text.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/auth/herder_text.dart';
import '../../../widget/back_appbar.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: BackAppBar(),
        title: Text(
          "forgetTitle".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              const CustomHeader(headerText: 'forgetHeader'),
              const SizedBox(height: 10),
              const CustomBody(bodyText: 'forgetBody'),
              const SizedBox(height: 20),
              CustomTextFormField(
                valid: (val) {
                  return validInput(val!, 7, 50, 'email');
                },
                title: 'email',
                hint: 'enterEmail',
                icon: Icons.email_outlined,
                myController: controller.email,
                type: TextInputType.emailAddress,
              ),
              CustomAuthButton(
                  text: 'checkEmail',
                  onPressed: () {
                    controller.checkEmail();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
