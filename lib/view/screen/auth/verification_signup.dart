import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/verification_signup_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/body_text.dart';
import '../../widget/auth/herder_text.dart';

class VerificationSignUp extends StatelessWidget {
  const VerificationSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifiedSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "verificationCode".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<VerifiedSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: ListView(
                      children: [
                        const CustomHeader(headerText: 'verificationHeader'),
                        const SizedBox(height: 10),
                        CustomBody(
                            bodyText:
                                '${'verificationBody'.tr} ${controller.email}'),
                        const SizedBox(height: 20),
                        OtpTextField(
                          autoFocus: true,
                          fieldWidth: 50,
                          borderRadius: BorderRadius.circular(15),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
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
                  ),
                )));
  }
}
