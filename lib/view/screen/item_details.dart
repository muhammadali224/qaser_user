import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';
import 'package:qaser_user/core/function/translate_database.dart';
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
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              height: 80,
                              width: 70,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Text(
                                      translateDatabase(
                                          controller.itemsModel.subItemNameAr!,
                                          controller.itemsModel.subItemName!),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${controller.itemsModel.subItemValue! * controller.itemsModel.itemDiscounntPrice!} ${"d".tr}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // TODO: create list named selected weight and size its take model and add to it first item list comed from api and with where
                            //
                            if (controller.itemsModel.weighIds!.isNotEmpty)
                              ...List.generate(
                                  5,
                                  (index) => Container(
                                        height: 80,
                                        width: 70,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                translateDatabase(
                                                    controller.itemsModel
                                                        .subItemNameAr!,
                                                    controller.itemsModel
                                                        .subItemName!),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${controller.itemsModel.subItemValue! * controller.itemsModel.itemDiscounntPrice!} ${"d".tr}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                          ],
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
