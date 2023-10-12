import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import 'items_detsils_title.dart';
import 'price_quantity.dart';
import 'select_sub_items.dart';

class ItemDetailsHeader extends StatelessWidget {
  const ItemDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImpl>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1.6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemsDetailsTitle(
              itemsModel: controller.itemsModel,
            ),
            const SizedBox(height: 10),
            PriceAndQuantity(
              itemCountModel: controller.cartController.itemCount,
              count: controller.itemsCount,
              onAdd: () => controller.add(),
              onRemove: () => controller.remove(),
              price: controller.itemsModel.itemDiscounntPrice!,
            ),
            if (controller.weightAndSize.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () => openSelectSubItems(context),
                  child: Center(
                    child: Text(
                      "pressToSelectSubItems".tr,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
