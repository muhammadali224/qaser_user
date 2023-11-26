import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/get_box_key.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model/items_model.dart';
import '../cached_network.dart';

class OffersHomeCard extends GetView<HomeControllerImp> {
  final ItemModel itemsModel;

  const OffersHomeCard({required this.itemsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "${itemsModel.itemsId}offers",
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => controller.goToDetails(itemsModel),
              child: CachedImage(
                fit: BoxFit.cover,
                imageUrl: "${AppLink.imagesItems}${itemsModel.itemsImage}",
                imageBuilder: (_, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                      image: DecorationImage(
                        image: imageProvider,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 1,
            child: Badge(
              showBadge: itemsModel.itemsDiscount == 0 ? false : true,
              badgeContent: Text(
                "${itemsModel.itemsDiscount}%",
                style: TextStyle(color: AppColor.backgroundColor, fontSize: 20),
              ),
              badgeStyle: const BadgeStyle(
                padding: EdgeInsets.all(5),
                shape: BadgeShape.instagram,
                elevation: 5,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.9),
                  borderRadius: controller.myServices.getBox
                              .read(GetBoxKey.language) ==
                          GetBoxKey.arLanguage
                      ? const BorderRadius.only(topLeft: Radius.circular(10))
                      : const BorderRadius.only(topRight: Radius.circular(10))),
              child: Text(
                "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
