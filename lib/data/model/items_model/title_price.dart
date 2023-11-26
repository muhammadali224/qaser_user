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
        Text(
          "${translateDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!)}",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        if (controller.itemsModel.itemsDiscount! > 0)
          Text(
            "${controller.itemsModel.itemsPrice} ${"jd".tr}",
            style:
                TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough),
          ),
        Text(
          "${controller.itemsModel.itemDiscounntPrice} ${"jd".tr}",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
