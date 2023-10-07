import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../controller/user_settings_controller/change_password_controller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/function/valid_input.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/body_text.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/auth/herder_text.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              IconBroken.Arrow___Right_2,
              size: 30,
            ),
          ),
          title: Text(
            "resetPasswordTitle".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ChangePasswordController>(
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
                          GetBuilder<ChangePasswordController>(
                            builder: (controller) => CustomTextFormField(
                              valid: (val) {
                                return validInput(val!, 5, 50, 'password');
                              },
                              obscureText: controller.isVisibleOldPassword,
                              onTapIcon: () {
                                controller.showOldPassword();
                              },
                              title: 'oldPassword',
                              hint: 'enterOldPassword',
                              icon: Icons.lock_outline,
                              myController: controller.oldPassword,
                            ),
                          ),
                          GetBuilder<ChangePasswordController>(
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
                          GetBuilder<ChangePasswordController>(
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
