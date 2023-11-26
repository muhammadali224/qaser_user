import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';
import 'package:qaser_user/view/widget/items_details/item_details/section_title.dart';

import '../../controller/items_controller/item_details_controller.dart';
import '../../data/model/items_model/title_price.dart';
import '../widget/items_details/item_details/bottom_nb_button.dart';
import '../widget/items_details/item_details/fav_counter_section.dart';
import '../widget/items_details/item_details/item_sliver_appbar.dart';
import '../widget/items_details/item_details/items_details_desc.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: controller.goToCart,
        elevation: 20,
        child: Icon(Bootstrap.cart3, color: Colors.white),
      ),
      bottomNavigationBar: ButtomNaviBar(),
      body: GetBuilder<ItemDetailsControllerImpl>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CustomScrollView(
              slivers: [
                ItemSliverAppbar(),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TitlePrice(),
                        SizedBox(height: 15),
                        Card(
                            child: CounterSection(
                                itemsModel: controller.itemsModel)),
                        SectionTitle(title: "price"),
                        Card(
                          child: Container(),
                        ),
                        SectionTitle(title: "description"),
                        Card(
                            child: ItemsDetailsDesc(
                          title: controller.itemsModel.itemsDesc!,
                          titleAr: controller.itemsModel.itemsDescAr!,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
