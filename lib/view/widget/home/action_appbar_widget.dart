import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/home_controller/home_controller.dart';

List<Widget> actionList = [
  GetBuilder<HomeControllerImp>(builder: (controller) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: controller.goToNotifications,
      child: const Icon(
        IconBroken.Notification,
        size: 30,
      ),
    );
  }),
];
