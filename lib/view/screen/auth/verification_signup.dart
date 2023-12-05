import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/verification_signup_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/body_text.dart';
import '../../widget/auth/herder_text.dart';
import '../../widget/back_appbar.dart';

class VerificationSignUp extends StatelessWidget {
  const VerificationSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifiedSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: BackAppBar(),
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
                          showCursor: false,
                          autoFocus: true,
                          disabledBorderColor: Colors.red,
                          focusedBorderColor: AppColor.red,
                          fieldWidth: 50,
                          showFieldAsBox: false,
                          numberOfFields: 5,
                          onSubmit: (String verificationCode) {
                            controller.checkCode(verificationCode);
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
