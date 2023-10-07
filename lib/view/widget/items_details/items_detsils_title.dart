import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model.dart';

class ItemsDetailsTitle extends StatelessWidget {
  final ItemsModel itemsModel;

  const ItemsDetailsTitle({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!)}",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.fourthColor),
        ),
        if (itemsModel.itemsDiscount != "0")
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: itemsModel.itemsPrice!,
                  style: DefaultTextStyle.of(context).style.copyWith(
                      decoration: TextDecoration.lineThrough, fontSize: 22),
                ),
                TextSpan(
                    text: 'jd'.tr,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 22)),
              ],
            ),
          ),
        // Text("${itemsModel.itemsPrice!} ${'jd'.tr}")
      ],
    );
  }
}
