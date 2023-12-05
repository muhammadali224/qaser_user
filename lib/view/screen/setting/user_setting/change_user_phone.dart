import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_settings_controller/user_setting_form_controller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/function/valid_input.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/back_appbar.dart';

class ChangeUserPhone extends StatelessWidget {
  const ChangeUserPhone({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserSettingFormController());
    return Scaffold(
      appBar: AppBar(
        title: Text('phone'.tr),
        leading: BackAppBar(),
      ),
      body: GetBuilder<UserSettingFormController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    CustomTextFormField(
                      title: 'phone',
                      hint: 'enterPhone',
                      icon: Icons.phone,
                      myController: controller.userTextController,
                      valid: (val) {
                        return validInput(val!, 9, 10, 'phone');
                      },
                      type: TextInputType.phone,
                    ),
                    CustomAuthButton(
                      text: 'edit',
                      onPressed: () {
                        controller.updateUserPhone();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
