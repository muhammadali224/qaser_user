import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/view/widget/cart/total_row_section.dart';

import '../../../controller/cart_controller/cart_controller.dart';

class CustomTotalPriceText extends StatelessWidget {
  const CustomTotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartControllerImp>(
            builder: (controller) {
              return Column(
                children: [
                  TotalRowSection(
                      title: 'totalPoints',
                      description: "${controller.totalPoint}"),
                  const SizedBox(height: 7),
                  TotalRowSection(
                      title: 'subPrice',
                      description: "${controller.price.toStringAsFixed(2)}"),
                  const SizedBox(height: 7),
                  TotalRowSection(
                      title: controller.couponValue != 0
                          ? '${'discount'.tr} ${controller.couponValue}%'
                          : "discount",
                      description: controller.getDiscountAmount()),
                  const SizedBox(height: 7),
                  if (controller.selectedOrderType == 1)
                    TotalRowSection(
                        title: 'deliveryCharge',
                        description: controller.deliveryFee),
                  const SizedBox(height: 7),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Divider(
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "${'total'.tr} :",
                          maxFontSize: 24,
                          minFontSize: 22,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        ),
                        AutoSizeText(
                          "${controller.getTotalOrderPrice()}",
                          maxFontSize: 24,
                          minFontSize: 22,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
