import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/cart_controller/cart_controller.dart';
import '../../../core/constant/color.dart';

class CheckoutOrderList extends GetView<CartControllerImp> {
  final void Function()? onChanged;
  final int value;

  final String title;
  final String icon;

  const CheckoutOrderList({
    super.key,
    this.onChanged,
    required this.value,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 150,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.fifthColor, width: 1.5),
            color: value == controller.selectedOrderType
                ? AppColor.primaryColor
                : AppColor.backgroundColor),
        child: Column(
          children: [
            Lottie.asset(
              icon,
              height: 100,
              fit: BoxFit.contain,
            ),
            Divider(
                color: value == controller.selectedOrderType
                    ? AppColor.backgroundColor
                    : AppColor.primaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title.tr,
                  style: TextStyle(
                      color: value == controller.selectedOrderType
                          ? AppColor.backgroundColor
                          : AppColor.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
