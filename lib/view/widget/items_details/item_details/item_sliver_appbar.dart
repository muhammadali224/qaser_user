import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/items_controller/item_details_controller.dart';

import '../../../../core/constant/api_link.dart';
import 'back_arrow.dart';

class ItemSliverAppbar extends GetView<ItemDetailsControllerImpl> {
  const ItemSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: false,
          statusBarIconBrightness: Brightness.light),
      expandedHeight: 320,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: controller.itemsModel.images!.isNotEmpty
            ? Swiper(
                itemCount: controller.itemsModel.images!.length,
                pagination: const SwiperPagination(
                    builder: SwiperPagination.dots,
                    margin: EdgeInsets.only(bottom: 30)),
                itemBuilder: (_, index) => CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imagesItems}${controller.itemsModel.images![index]}",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              )
            : CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagesItems}${controller.itemsModel.itemsImage}",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          alignment: Alignment.center,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(40)),
          ),
        ),
      ),
      leadingWidth: 80,
      leading: BackArrow(),
    );
  }
}
