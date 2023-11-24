import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';
import 'package:qaser_user/core/constant/api_link.dart';
import 'package:qaser_user/core/function/translate_database.dart';
import 'package:qaser_user/view/widget/back_arrow.dart';

import '../../controller/items_controller/item_details_controller.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImpl controller = Get.put(ItemDetailsControllerImpl());
    // return Scaffold(
    //   backgroundColor: Colors.grey[100],
    //   bottomNavigationBar: Container(
    //     //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //     height: 50,
    //     width: double.infinity,
    //     color: Colors.transparent,
    //     child: MaterialButton(
    //       color: AppColor.primaryColor,
    //       onPressed: controller.goToCart,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text("goToCart".tr),
    //           const SizedBox(width: 10),
    //           const Icon(IconBroken.Buy)
    //         ],
    //       ),
    //     ),
    //   ),
    //   appBar: AppBar(
    //       leading: BackAppBar(),
    //       title: Text(
    //         translateDatabase(controller.itemsModel.itemsNameAr!,
    //             controller.itemsModel.itemsName!),
    //         style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    //       )),
    //   body: GetBuilder<ItemDetailsControllerImpl>(
    //     builder: (controller) => HandlingDataView(
    //       statusRequest: controller.statusRequest,
    //       widget: ListView(
    //         children: [
    //           const TopImagesSlider(),
    //           const SizedBox(height: 15),
    //           const ItemDetailsHeader(),
    //           const SizedBox(height: 15),
    //           ItemsDetailsDesc(
    //               title: controller.itemsModel.itemsDesc!,
    //               titleAr: controller.itemsModel.itemsDescAr!),
    //           const SizedBox(height: 15),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: GetBuilder<ItemDetailsControllerImpl>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: CustomScrollView(
            slivers: [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    systemStatusBarContrastEnforced: false,
                    statusBarIconBrightness: Brightness.light),
                expandedHeight: 300,
                pinned: true,
                elevation: 0.0,
                stretch: true,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                  background: CachedNetworkImage(
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
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ),
                leadingWidth: 80,
                leading: BackArrow(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                          "${translateDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!)}")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// Stack(
// children: [
// // SizedBox(
// //     width: double.infinity,
// //     height: Get.height / 2,
// //     child: CachedNetworkImage(
// //       imageUrl:
// //           "${AppLink.imagesItems}${controller.itemsModel.itemsImage}",
// //       filterQuality: FilterQuality.high,
// //       fit: BoxFit.fill,
// //     )
// //     //     ListView(
// //     //   shrinkWrap: true,
// //     //   scrollDirection: Axis.horizontal,
// //     //   children: controller.itemsModel.images!
// //     //       .map((e) => CachedNetworkImage(
// //     //           imageUrl: "${AppLink.imagesItems}$e"))
// //     //       .toList(),
// //     // ),
// //
// //     ),
// CachedNetworkImage(
// imageUrl:
// "${AppLink.imagesItems}${controller.itemsModel.itemsImage}",
// imageBuilder: (_, imageProvider) => Container(
// width: double.infinity,
// height: Get.height / 2.4,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: imageProvider,
// filterQuality: FilterQuality.high,
// fit: BoxFit.cover,
// )),
// ),
// ),
//
// BackArrow(),
// // DraggableScrollableSheet(
// //   initialChildSize: 0.6,
// //   maxChildSize: 1.0,
// //   minChildSize: 0.6,
// //   builder: (BuildContext context,
// //           ScrollController scrollController) =>
// //       Container(
// //     padding: const EdgeInsets.symmetric(horizontal: 20),
// //     clipBehavior: Clip.hardEdge,
// //     decoration: const BoxDecoration(
// //       color: Colors.white,
// //       borderRadius: BorderRadius.only(
// //           topLeft: const Radius.circular(20),
// //           topRight: const Radius.circular(20)),
// //     ),
// //   ),
// // )
// ],
// ),
