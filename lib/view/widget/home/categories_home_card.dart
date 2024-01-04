import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/categories_model.dart';
import '../cached_network.dart';

class CategoriesHomeCard extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const CategoriesHomeCard(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => controller.goToItems(
                controller.categoriesList, categoriesModel, i),
            child: CachedImage(
              imageUrl:
                  "${AppLink.imagesCategories}${categoriesModel.categoriesImage}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    color: AppColor.theirdColor,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ),
        Expanded(
          child: AutoSizeText(
            '${translateDatabase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!)}'
                .capitalizeFirst!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
