import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/sub_items_model.dart';

openSelectSubItems(BuildContext context) {
  return showModalBottomSheet(
    showDragHandle: true,
    elevation: 10,
    context: context,
    builder: (BuildContext context) => Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      height: Get.height / 2,
      width: double.infinity,
      child: GetBuilder<ItemDetailsControllerImpl>(builder: (controller) {
        return ListView(
          children: [
            if (controller.weightAndSize.isNotEmpty)
              Column(
                children: [
                  Text(
                    "size".tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  ...List.generate(controller.weightAndSize.length, (index) {
                    if (controller.weightAndSize[index].isActive == "1") {
                      return Center(
                        child: RadioListTile<SubItemsModel>(
                          title: Text(
                            translateDatabase(
                                controller.weightAndSize[index].subItemNameAr!,
                                controller.weightAndSize[index].subItemName!),
                            style: const TextStyle(fontSize: 18),
                          ),
                          secondary: Text(
                            "${double.parse(controller.itemsModel.itemDiscountPrice!) * double.parse(controller.weightAndSize[index].subItemValue!)} ${'jd'.tr}"
                                .tr,
                            style: const TextStyle(fontSize: 18),
                          ),
                          value: controller.weightAndSize[index],
                          onChanged: (value) {
                            // controller.selectedWeightAndSize = value;
                            // controller.update();
                            controller.setSelectedWeightAndSize(value!);
                            Get.back();
                          },
                          activeColor: Colors.red,
                          groupValue: controller.selectedWeightAndSize,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
          ],
        );
      }),
    ),
  );
}
