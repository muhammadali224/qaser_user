import 'package:badges/badges.dart' as badges;
import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/favorite_controller/favorite_controller.dart';
import '../../../controller/offers_controller/offers_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model.dart';

class CustomOfferListItems extends GetView<OffersController> {
  final ItemsModel itemsModel;

  const CustomOfferListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesItems}${itemsModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    badges.Badge(
                      showBadge: itemsModel.itemsDiscount == "0" ? false : true,
                      position:
                          badges.BadgePosition.topStart(top: -10, start: -12),
                      badgeContent: Text(
                        "${itemsModel.itemsDiscount}%",
                        style: TextStyle(
                            color: AppColor.backgroundColor, fontSize: 20),
                      ),
                      badgeStyle: const badges.BadgeStyle(
                        padding: EdgeInsets.all(5),
                        shape: badges.BadgeShape.instagram,
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("4.6"),
                  SizedBox(
                    height: 25,
                    child: Row(
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
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.itemDiscountPrice} ${'jd'.tr}",
                      style: TextStyle(
                          color: AppColor.marron, fontWeight: FontWeight.bold)),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                        onPressed: () {
                          if (controller.isFavorite[itemsModel.itemsId] ==
                              "1") {
                            controller.setFavorite(itemsModel.itemsId!, "0");
                            controller
                                .removeFavorite(itemsModel.itemsId.toString());
                          } else {
                            controller.setFavorite(itemsModel.itemsId!, "1");
                            controller
                                .addFavorite(itemsModel.itemsId.toString());
                          }
                        },
                        icon: Icon(
                          controller.isFavorite[itemsModel.itemsId] == "1"
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: AppColor.primaryColor,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
