import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forget_password_controller/reset_password_controller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/function/valid_input.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/body_text.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/auth/herder_text.dart';
import '../../../widget/back_appbar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: BackAppBar(),
          title: Text(
            "resetPasswordTitle".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          const CustomHeader(headerText: 'resetPasswordHeader'),
                          const SizedBox(height: 10),
                          const CustomBody(bodyText: 'resetPasswordBody'),
                          const SizedBox(height: 20),
                          GetBuilder<ResetPasswordControllerImp>(
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
                          GetBuilder<ResetPasswordControllerImp>(
                            builder: (controller) => CustomTextFormField(
                              valid: (val) {
                                return validInput(val!, 5, 50, 'password');
                              },
                              obscureText: controller.isVisiblePassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              title: 'password',
                              hint: 'reEnterPassword',
                              icon: Icons.lock_outline,
                              myController: controller.rePassword,
                            ),
                          ),
                          CustomAuthButton(
                              text: 'save',
                              onPressed: () {
                                controller.resetPassword();
                              }),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
