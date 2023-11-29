import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/items_controller/item_details_controller.dart';

import '../../../core/function/translate_database.dart';

class TitlePrice extends GetView<ItemDetailsControllerImpl> {
  const TitlePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "${translateDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!)}",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            if (controller.itemsModel.itemsDiscount! > 0)
              Text(
                "${controller.itemsModel.itemsPrice} ${"jd".tr}",
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.lineThrough),
              ),
          ],
        ),
        Column(
          children: [
            RichText(
                text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text:
                        "${(controller.itemPrice).toStringAsFixed(2)} ${"d".tr}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: "/",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    )),
                TextSpan(
                    text:
                        " ${translateDatabase(controller.selectedWeightAndSize.subItemNameAr!, controller.selectedWeightAndSize.subItemName!)}",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))
              ],
            )),
            if (controller.itemsModel.itemsPointPerVal! > 0)
              Obx(() {
                return Text(
                  "${(controller.totalPoint).toStringAsFixed(2)} ${"point".tr}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                );
              }),
          ],
        ),
      ],
    );
  }
}
