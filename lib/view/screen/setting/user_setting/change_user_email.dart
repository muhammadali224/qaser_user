import "package:flutter/material.dart";
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/user_settings_controller/change_email_controller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/function/valid_input.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/back_appbar.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangeEmailController());
    return Scaffold(
      appBar: AppBar(
        title: Text('email'.tr),
        leading: BackAppBar(),
      ),
      body: GetBuilder<ChangeEmailController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  CustomTextFormField(
                    title: 'email',
                    hint: 'enterEmail',
                    icon: Icons.email,
                    myController: controller.userTextController,
                    valid: (val) {
                      return validInput(val!, 5, 50, 'email');
                    },
                    type: TextInputType.emailAddress,
                  ),
                  CustomAuthButton(
                    text: 'checkEmail',
                    onPressed: () {
                      controller.checkEmail();
                    },
                  ),
                  const SizedBox(height: 30),
                  if (controller.showOTP == true)
                    Column(
                      children: [
                        OtpTextField(
                          autoFocus: true,
                          fieldWidth: 50,
                          borderRadius: BorderRadius.circular(15),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          showFieldAsBox: true,
                          onSubmit: (String verificationCode) {
                            controller.checkCode(int.parse(verificationCode));
                          }, // end onSubmit
                        ),
                        TextButton(
                            onPressed: () {
                              controller.resendVerify();
                            },
                            child: Text("resendVerify".tr))
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
