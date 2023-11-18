import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/items_model.dart';
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
          itemCount: controller.itemsOfferList.length > 3
              ? 3
              : controller.itemsOfferList.length,
        ));
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;

  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => controller.goToDetails(itemsModel),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagesItems}${itemsModel.itemsImage}",
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.broken_image_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
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
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
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
