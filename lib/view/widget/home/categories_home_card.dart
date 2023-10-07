import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/categories_model.dart';

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
          // width: 90,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              controller.goToItems(controller.categories, i,
                  categoriesModel.categoriesId.toString());
            },
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    color: AppColor.theirdColor,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
              ),
              imageUrl:
                  "${AppLink.imagesCategories}${categoriesModel.categoriesImage}",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                IconBroken.Category,
              ),
            ),
          ),
        ),
        Text(
          '${translateDatabase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!)}'
              .capitalizeFirst!,
          overflow: TextOverflow.fade,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
