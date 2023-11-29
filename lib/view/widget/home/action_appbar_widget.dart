import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/home_controller/home_controller.dart';

class NotificationIcon extends GetView<HomeControllerImp> {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: controller.goToNotifications,
        child: const Icon(
          IconBroken.Notification,
          size: 30,
        ),
      ),
    );
  }
}
