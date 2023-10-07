import 'package:badges/badges.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/favorite_controller/favorite_controller.dart';
import '../../../controller/items_controller/items_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToDetails(itemsModel),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        color: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
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
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.broken_image_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Badge(
                          showBadge:
                              itemsModel.itemsDiscount == "0" ? false : true,
                          // position:
                          //     BadgePosition.topStart(top: -10, start: -12),

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
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  size: 17,
                                  color: index < 4 ? Colors.orange : null,
                                ))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${itemsModel.itemsPrice} ${'jd'.tr}",
                            style: TextStyle(
                                color: AppColor.marron,
                                fontWeight: FontWeight.bold)),
                        GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    "1") {
                                  controller.setFavorite(
                                      itemsModel.itemsId!, "0");
                                  controller.removeFavorite(
                                      itemsModel.itemsId.toString());
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId!, "1");
                                  controller.addFavorite(
                                      itemsModel.itemsId.toString());
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.red,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
