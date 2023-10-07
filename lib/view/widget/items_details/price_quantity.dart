import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/item_count_model.dart';

class PriceAndQuantity extends StatelessWidget {
  final void Function() onAdd;
  final int count;
  final String price;
  final void Function() onRemove;
  final ItemCountModel itemCountModel;

  const PriceAndQuantity({
    Key? key,
    required this.onAdd,
    required this.count,
    required this.price,
    required this.onRemove,
    required this.itemCountModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.add_circle,
                color: AppColor.primaryColor,
              ),
            ),
            GetBuilder<ItemDetailsControllerImpl>(builder: (controller) {
              return Directionality(
                textDirection: TextDirection.ltr,
                child: AnimatedFlipCounter(
                    textStyle: const TextStyle(fontSize: 22),
                    duration: const Duration(milliseconds: 500),
                    value: controller.itemsCount), // pass in a value like 2014
              );
            }),
            IconButton(
              onPressed: onRemove,
              icon: Icon(
                Icons.remove_circle,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        GetBuilder<ItemDetailsControllerImpl>(builder: (controller) {
          return RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: controller.selectedWeightAndSize.weightSizeId != null
                      ? "${double.parse(controller.selectedWeightAndSize.subItemValue!) * double.parse(price)}${'jd'.tr}"
                      : "${controller.itemsModel.itemDiscountPrice} ${'jd'.tr}",
                  style: TextStyle(color: AppColor.marron, fontSize: 28),
                ),
                TextSpan(
                  text: controller.selectedWeightAndSize.weightSizeId != null
                      ? " / ${translateDatabase(controller.selectedWeightAndSize.subItemNameAr!, controller.selectedWeightAndSize.subItemName!)}"
                      : "",
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
