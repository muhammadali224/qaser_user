import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/items_controller/items_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model/items_model.dart';
import '../cached_network.dart';
import '../items_details/item_details/fav_button.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemModel itemsModel;

  const CustomListItems({super.key, required this.itemsModel});

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
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Hero(
                    tag: "${itemsModel.itemsId}",
                    child: Stack(
                      children: [
                        CachedImage(
                          imageUrl:
                              "${AppLink.imagesItems}${itemsModel.itemsImage}",
                          imageBuilder: (_, imageProvider) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Badge(
                          showBadge:
                              itemsModel.itemsDiscount == 0 ? false : true,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPrice} ${'jd'.tr}",
                              style: TextStyle(
                                  color: AppColor.marron,
                                  fontWeight: FontWeight.bold)),
                          FavoriteButton(itemsModel: itemsModel)
                        ],
                      ),
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
