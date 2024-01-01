import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import 'offers_home_card.dart';

class ListOffersHome extends GetView<HomeControllerImp> {
  const ListOffersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            if (controller.itemsOfferList.isNotEmpty) {
              return OffersHomeCard(itemsModel: controller.itemsOfferList[i]);
            } else {
              return Container();
            }
          },
          itemCount: controller.itemsOfferList.length > 5
              ? 5
              : controller.itemsOfferList.length,
        ));
  }
}
