import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/favorite_controller/my_favorite_controller.dart';
import 'package:qaser_user/data/model/items_model/items_model.dart';

import '../../../../core/constant/color.dart';

class FavoriteButton extends StatelessWidget {
  final ItemModel itemsModel;
  final double? size;
  const FavoriteButton({super.key, required this.itemsModel, this.size});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return GetBuilder<MyFavoriteController>(
      builder: (controller) => Container(
        margin: EdgeInsets.all(5),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: IconButton(
              onPressed: () {
                if (controller.isFavorite[itemsModel.itemsId] == 1) {
                  controller.setFavorite(itemsModel.itemsId!, 0);
                  controller.removeFavorite(itemsModel.itemsId!);
                } else {
                  controller.setFavorite(itemsModel.itemsId!, 1);
                  controller.addFavorite(itemsModel.itemsId!);
                }
              },
              icon: Icon(
                controller.isFavorite[itemsModel.itemsId] == 1
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: AppColor.red,
                size: size,
              )),
        ),
      ),
    );
  }
}
