import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/items_controller/item_details_controller.dart';

import '../../../core/function/translate_database.dart';

class TitlePrice extends GetView<ItemDetailsControllerImpl> {
  const TitlePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                "${translateDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!)}",
                maxLines: 2,
                overflow: TextOverflow.fade,
                maxFontSize: 24,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            RichText(
                text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text:
                        "${(controller.itemPrice).toStringAsFixed(2)} ${"d".tr}",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    )),
              ],
            )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.itemsModel.itemsDiscount! > 0
                ? Text(
                    "${controller.itemsModel.itemsPrice} ${"jd".tr}",
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.lineThrough),
                  )
                : SizedBox(),
            if (controller.itemsModel.itemsPointPerVal! > 0)
              Obx(() {
                return AutoSizeText(
                  "${(controller.totalPoint).toStringAsFixed(2)} ${"point".tr}",
                  maxFontSize: 20,
                  maxLines: 2,
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
