import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/cart_controller/cart_controller.dart';
import '../../../core/constant/color.dart';

class LeadingAppbar extends GetView<CartControllerImp> {
  final void Function()? onTap;

  const LeadingAppbar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Center(
      child: GetBuilder<CartControllerImp>(
          builder: (controller) => controller.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : Badge(
                  showBadge: controller.ordersCount == 0 ? false : true,
                  badgeContent: Text(
                    controller.ordersCount.toString(),
                    style: TextStyle(
                        color: AppColor.backgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                  badgeStyle: const BadgeStyle(shape: BadgeShape.circle),
                  position: BadgePosition.topStart(top: -15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: onTap,
                    child: const Icon(
                      IconBroken.Bag,
                      size: 30,
                    ),
                  ),
                )),
    );
  }
}
