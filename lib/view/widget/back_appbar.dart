import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/services.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          myServices.getBox.read(GetBoxKey.language) == GetBoxKey.arLanguage
              ? IconBroken.Arrow___Right_2
              : IconBroken.Arrow___Left_2,
          size: 30,
        ),
      ),
    );
  }
}
