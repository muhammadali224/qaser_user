import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model/items_model.dart';
import '../cached_network.dart';
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

class Items extends GetView<HomeControllerImp> {
  final ItemModel itemsModel;

  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => controller.goToDetails(itemsModel),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
        elevation: 5,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: CachedImage(
                    imageUrl: "${AppLink.imagesItems}${itemsModel.itemsImage}",
                    imageBuilder: (_, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        "${translateDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!.capitalizeEach())}",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 35,
                      child: Text("${itemsModel.itemsPrice} ${'jd'.tr}",
                          style: TextStyle(
                              color: AppColor.marron,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
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
