import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/app.service.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        margin:
            myServices.getBox.read(GetBoxKey.language) == GetBoxKey.arLanguage
                ? EdgeInsets.only(right: 24)
                : EdgeInsets.only(left: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              alignment: Alignment.center,
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.4),
              ),
              child: Icon(IconBroken.Arrow___Right_2),
            ),
          ),
        ),
      ),
    );
  }
}
