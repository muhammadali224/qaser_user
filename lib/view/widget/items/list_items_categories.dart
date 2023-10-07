import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/items_controller.dart';
import 'categories_chips.dart';

class ItemsCategoriesList extends GetView<ItemsControllerImp> {
  const ItemsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoriesChips(
            i: index,
            categoriesModel: controller.categories[index],
          );
        },
      ),
    );
  }
}
