import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import 'list_home_items.dart';

class ListTopSellingHome extends GetView<HomeControllerImp> {
  const ListTopSellingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
        itemCount: controller.topSellingList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, i) {
          return Items(itemsModel: controller.topSellingList[i]);
        },
      ),
    );
  }
}
