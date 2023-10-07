import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/signup_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/exit_alert.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/body_text.dart';
import '../../widget/auth/custom_text_form_field.dart';
import '../../widget/auth/herder_text.dart';
import '../../widget/auth/signin_auth_text.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: Text(
            "signup".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: () => exitAlert(),
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      const CustomHeader(headerText: 'authHeader'),
                      const SizedBox(height: 10),
                      const CustomBody(bodyText: 'authSignUpBody'),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        valid: (val) {
                          return validInput(val!, 4, 50, 'userName');
                        },
                        title: 'userName',
                        hint: 'enterUserName',
                        icon: Icons.person_outline,
                        myController: controller.userName,
                      ),
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
                      CustomTextFormField(
                        valid: (val) {
                          return validInput(val!, 10, 50, 'phone');
                        },
                        title: 'phone',
                        hint: 'enterPhone',
                        icon: Icons.phone,
                        myController: controller.phone,
                        type: TextInputType.phone,
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomTextFormField(
                          valid: (val) {
                            return validInput(val!, 5, 50, 'password');
                          },
                          obscureText: controller.isVisiblePassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          title: 'password',
                          hint: 'enterPassword',
                          icon: Icons.lock_outline,
                          myController: controller.password,
                        ),
                      ),
                      CustomAuthButton(
                          text: 'signup',
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 30),
                      CustomSigninText(
                        account: 'haveAccount',
                        sign: 'signin',
                        onTap: () => controller.goToLogin(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
