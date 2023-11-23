import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/function/valid_input.dart';
import '../../../../controller/auth_controller/sms_controller.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/body_text.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/auth/herder_text.dart';
import '../../../widget/back_appbar.dart';

class SendSMSVerify extends StatelessWidget {
  const SendSMSVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SMSController());
    return Scaffold(
      appBar: AppBar(
        leading: BackAppBar(),
        title: Text(
          "verifySMS".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SMSController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomHeader(headerText: controller.headerTitle),
                  const SizedBox(height: 10),
                  const CustomBody(bodyText: 'mobileConfirm'),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 9, 15, 'phone');
                    },
                    title: 'phone',
                    hint: 'enterPhone',
                    icon: Icons.phone_android,
                    myController: controller.phoneNumber,
                    type: TextInputType.phone,
                    onSubmit: (_) {
                      controller.sendSMS();
                    },
                  ),
                  CustomAuthButton(
                      color: Colors.red,
                      text: 'checkMobile',
                      onPressed: controller.sendSMS),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
