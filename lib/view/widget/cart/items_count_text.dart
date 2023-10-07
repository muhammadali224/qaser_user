import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller/cart_controller.dart';

class ItemsCountText extends StatelessWidget {
  const ItemsCountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          controller.ordersCount <= 0
              ? ""
              : controller.ordersCount == 1 || controller.ordersCount >= 11
                  ? "${controller.ordersCount} ${"cartItem".tr}"
                  : "${controller.ordersCount} ${"cartItems".tr}",
          style: const TextStyle(fontSize: 18),
        ),
      );
    });
  }
}
