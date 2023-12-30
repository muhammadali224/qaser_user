import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/items_controller/item_details_controller.dart';
import 'package:qaser_user/view/widget/items_details/item_details/section_title.dart';

import '../../../../core/function/translate_database.dart';

class SubItemsContainer extends GetView<ItemDetailsControllerImpl> {
  const SubItemsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading == true
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator()))
          : Visibility(
              visible: controller.subItemsList.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionTitle(title: "weightSize"),
                  GetBuilder<ItemDetailsControllerImpl>(builder: (controller) {
                    return Wrap(
                      direction: Axis.horizontal,
                      children: [
                        ...List.generate(
                          controller.subItemsList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              controller.setSelectedWeightAndSize(
                                  controller.subItemsList[index]);
                            },
                            child: Container(
                              height: 80,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: controller
                                              .subItemsList[index].subItemId ==
                                          controller.selectedSubItems?.subItemId
                                      ? Colors.red
                                      : Colors.red.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: AutoSizeText(
                                        translateDatabase(
                                            controller.subItemsList[index]
                                                .subItemsNameAr!,
                                            controller.subItemsList[index]
                                                .subItemsName!),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AutoSizeText(
                                          "${(controller.subItemsList[index].subItemsPrice!).toStringAsFixed(2)} ${"d".tr}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration: controller
                                                          .subItemsList[index]
                                                          .subItemsDiscount! >
                                                      0
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        if (controller.subItemsList[index]
                                                .subItemsDiscount! >
                                            0)
                                          AutoSizeText(
                                            "${(controller.subItemsList[index].subItemsPrice! - (controller.subItemsList[index].subItemsPrice! * (controller.subItemsList[index].subItemsDiscount! / 100))).toStringAsFixed(2)} ${"d".tr}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ],
              ));
    });
  }
}
