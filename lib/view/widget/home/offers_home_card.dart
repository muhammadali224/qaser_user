import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model.dart';

class OffersHomeCard extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const OffersHomeCard({required this.itemsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToDetails(itemsModel),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        color: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: "${itemsModel.itemsId}",
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imagesItems}${itemsModel.itemsImage}",
                        fit: BoxFit.contain,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.broken_image_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Badge(
                      showBadge: itemsModel.itemsDiscount == 0 ? false : true,
                      badgeContent: Text(
                        "${itemsModel.itemsDiscount}%",
                        style: TextStyle(
                            color: AppColor.backgroundColor, fontSize: 20),
                      ),
                      badgeStyle: const BadgeStyle(
                        padding: EdgeInsets.all(5),
                        shape: BadgeShape.instagram,
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    borderRadius: controller.myServices.sharedPref
                                .getString('language') ==
                            'ar'
                        ? const BorderRadius.only(topLeft: Radius.circular(15))
                        : const BorderRadius.only(
                            topRight: Radius.circular(15))),
                child: Text(
                  "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
