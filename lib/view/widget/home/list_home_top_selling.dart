import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../data/model/items_model/items_model.dart';
import '../items/custom_list_items.dart';

class ListTopSellingHome extends StatelessWidget {
  final List<ItemModel> itemList;
  final String tag;

  const ListTopSellingHome(
      {required this.tag, required this.itemList, super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
        itemCount: itemList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, i) {
          controller.favController.isFavorite[itemList[i].itemsId] =
              itemList[i].isFavorite;
          return CustomListItems(
            itemsModel: itemList[i],
            onTap: () => controller.goToDetails(itemList[i], "topSelling"),
            heroTag: tag,
          );
        },
      ),
    );
  }
}
