import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller/cart_controller.dart';
import 'coupon_button.dart';
import 'success_coupon.dart';

class CheckoutCoupon extends StatelessWidget {
  const CheckoutCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => controller.couponName == null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: TextFormField(
                        onFieldSubmitted: (val) {
                          controller.checkCoupon();
                        },
                        controller: controller.couponController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "haveCoupon".tr,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          border: const OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: CouponButton(
                        onPressed: () => controller.checkCoupon(),
                      )),
                ],
              ),
            )
          : SuccessCoupon(couponName: controller.couponName!),
    );
  }
}
