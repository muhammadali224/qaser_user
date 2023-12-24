import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../data/model/items_model/items_model.dart';
import 'list_home_items.dart';

class ListTopSellingHome extends GetView<HomeControllerImp> {
  const ListTopSellingHome({required this.itemList, super.key});
  final List<ItemModel> itemList;

  @override
  Widget build(BuildContext context) {
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
          return Items(itemsModel: itemList[i]);
        },
      ),
    );
  }
}
