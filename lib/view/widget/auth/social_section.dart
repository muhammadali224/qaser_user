import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/core/constant/color.dart';

import '../../../controller/auth_controller/login_controller.dart';

class SocialSection extends GetView<LoginControllerImp> {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: controller.goToLoginWithSMS,
          color: AppColor.red,
          iconSize: 40,
          icon: Icon(EvaIcons.message_square_outline),
        ),
        // IconButton(
        //   onPressed: controller.googleSignIn,
        //   iconSize: 40,
        //   icon: Brand(Brands.google),
        // ),
      ],
    );
  }
}
