import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:string_capitalize/string_capitalize.dart';

import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model/items_model.dart';
import '../cached_network.dart';
import '../items_details/item_details/fav_button.dart';

class CustomListItems extends StatelessWidget {
  final ItemModel itemsModel;
  final String heroTag;
  final void Function() onTap;

  const CustomListItems(
      {super.key,
      required this.itemsModel,
      required this.onTap,
      required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                    tag: "${itemsModel.itemsId}$heroTag",
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
                        Align(
                          alignment: Alignment.topRight,
                          child: Badge(
                            showBadge:
                                itemsModel.itemsDiscount == 0 ? false : true,
                            badgeContent: Text("${itemsModel.itemsDiscount}%",
                                style: TextStyle(
                                    color: AppColor.backgroundColor,
                                    fontSize: 20)),
                            badgeStyle: const BadgeStyle(
                              padding: EdgeInsets.all(5),
                              shape: BadgeShape.instagram,
                              elevation: 5,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FavoriteButton(itemsModel: itemsModel),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: AutoSizeText(
                "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
