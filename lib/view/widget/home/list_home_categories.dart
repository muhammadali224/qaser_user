import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import 'categories_home_card.dart';

class HomeCategoriesList extends GetView<HomeControllerImp> {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            itemCount: controller.categoriesList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.6,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return CategoriesHomeCard(
                  i: index, categoriesModel: controller.categoriesList[index]);
            }));
  }
}
