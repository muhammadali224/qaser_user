import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import '../../../core/constant/api_link.dart';

class TopImagesSlider extends GetView<ItemDetailsControllerImpl> {
  const TopImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Hero(
          tag: "${controller.itemsModel.itemsId}",
          child: Swiper(
            pagination: const SwiperPagination(
              builder: SwiperPagination.dots,
            ),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagesItems}${controller.imagesList[index].itemImageName}",
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.broken_image_rounded,
                  color: Colors.red,
                ),
              );
            },
            itemCount: controller.imagesList.length,
            scale: 0.9,
          ),
        ),
      ),
    );
  }
}
