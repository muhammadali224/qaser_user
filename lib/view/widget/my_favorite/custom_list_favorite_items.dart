import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/favorite_controller/my_favorite_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/my_favorite_model.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;

  final void Function()? onCardPressed;

  const CustomListFavoriteItems({
    super.key,
    this.onCardPressed,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesItems}${itemsModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
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
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.itemsPrice} ${'jd'.tr}",
                      style: TextStyle(
                          color: AppColor.marron, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {
                        controller.deleteFavoriteItems(
                            itemsModel.favoriteId.toString());
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColor.primaryColor,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
