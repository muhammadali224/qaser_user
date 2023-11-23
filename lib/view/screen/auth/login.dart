import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/login_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/email_password_signin.dart';
import '../../widget/auth/or_line.dart';
import '../../widget/auth/signin_auth_text.dart';
import '../../widget/auth/social_section.dart';
import '../../widget/back_appbar.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: BackAppBar(),
          title: Text(
            "signin".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          EmailPasswordSignin(),
                          const SizedBox(height: 10),
                          OrSection(),
                          SocialSection(),
                          CustomSigninText(
                            account: 'dontHaveAccount',
                            sign: 'signup',
                            onTap: () => controller.goToSignUp(),
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
