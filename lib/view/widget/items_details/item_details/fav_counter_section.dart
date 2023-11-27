import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/data/model/items_model/items_model.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import '../../../../core/constant/color.dart';

class CounterSection extends GetView<ItemDetailsControllerImpl> {
  final ItemModel itemsModel;

  const CounterSection({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: controller.add,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.add_circle,
                color: AppColor.red,
                size: 30,
              ),
            ),
            Obx(() => Directionality(
                  textDirection: TextDirection.ltr,
                  child: AnimatedFlipCounter(
                      textStyle:
                          const TextStyle(fontSize: 25, color: Colors.black),
                      duration: const Duration(milliseconds: 500),
                      value: controller
                          .itemsCount.value), // pass in a value like 2014
                )),
            IconButton(
              onPressed: controller.remove,
              icon: Icon(
                Icons.remove_circle,
                color: AppColor.red,
                size: 30,
              ),
            ),
          ],
        ),
        Obx(() {
          return Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "${(controller.totalPrice).toStringAsFixed(2)} ${"d".tr}",
                style: TextStyle(fontSize: 22),
              ));
        }),
//
      ],
    );
  }
}
