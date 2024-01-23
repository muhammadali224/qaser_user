import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';

class SwiperCard extends GetView<HomeControllerImp> {
  const SwiperCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      height: Get.height / 4.3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Swiper(
        autoplay: true,
        pagination: const SwiperPagination(
          builder: SwiperPagination.rect,
        ),
        itemBuilder: (context, index) {
          return CacheNetworkImagePlus(
            imageUrl:
                "${AppLink.imageOffer}${controller.offerImagesList[index].offerImageUrl}",
            boxFit: BoxFit.fill,
            imageBuilder: (_, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  )),
            ),
            errorWidget: const Icon(
              Icons.broken_image_rounded,
              color: Colors.red,
            ),
          );
        },
        itemCount: controller.offerImagesList.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
