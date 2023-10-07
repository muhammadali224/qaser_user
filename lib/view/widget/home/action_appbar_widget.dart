import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/color.dart';

// HomeControllerImp homeController = Get.find();
List<Widget> actionList = [
  Center(
    child: GetBuilder<HomeControllerImp>(builder: (controller) {
      return Badge(
        showBadge: controller.notificationsCount == 0 ? false : true,
        badgeStyle: const BadgeStyle(shape: BadgeShape.circle),
        badgeContent: Text(
          controller.notificationsCount.toString(),
          style: TextStyle(
              color: AppColor.backgroundColor, fontWeight: FontWeight.bold),
        ),
        position: BadgePosition.topStart(top: -15),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => controller.goToNotifications(),
          child: const Icon(
            IconBroken.Notification,
            size: 30,
          ),
        ),
      );
    }),
  ),
];
