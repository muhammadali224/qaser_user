import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/login_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/body_text.dart';
import '../../widget/auth/custom_text_form_field.dart';
import '../../widget/auth/herder_text.dart';
import '../../widget/auth/logo.dart';
import '../../widget/auth/signin_auth_text.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "signin".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: PopScope(
            canPop: false,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              const CustomHeader(headerText: 'authHeader'),
                              const SizedBox(height: 10),
                              const CustomBody(bodyText: 'authLoginBody'),
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
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomTextFormField(
                                  valid: (val) {
                                    return validInput(val!, 5, 50, 'password');
                                  },
                                  onSubmit: (val) {
                                    controller.login();
                                  },
                                  obscureText: controller.isVisiblePassword,
                                  onTapIcon: () => controller.showPassword(),
                                  title: 'password',
                                  hint: 'enterPassword',
                                  icon: Icons.lock_outline,
                                  myController: controller.password,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "forget".tr,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: AppColor.black),
                                ),
                              ),
                              CustomAuthButton(
                                  text: 'signin',
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(height: 30),
                              CustomSigninText(
                                account: 'dontHaveAccount',
                                sign: 'signup',
                                onTap: () => controller.goToSignUp(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
