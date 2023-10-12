import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/categories_model.dart';

class CategoriesChips extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const CategoriesChips(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => ChoiceChip(
        onSelected: (value) {
          controller.changeChips(i, categoriesModel.categoriesId);
        },
        labelStyle: TextStyle(
            color:
                controller.selectedCategory == i ? Colors.black : AppColor.grey,
            fontSize: 20),
        label: Text(
            '${translateDatabase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!)}'),
        selected: controller.selectedCategory == i ? true : false,
        selectedColor: AppColor.primaryColor,
      ),
    );
  }
}
