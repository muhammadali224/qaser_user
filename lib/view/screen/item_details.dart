import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';
import 'package:qaser_user/view/widget/items_details/item_details/section_title.dart';

import '../../controller/items_controller/item_details_controller.dart';
import '../../core/function/translate_database.dart';
import '../widget/items_details/item_details/bottom_nb_button.dart';
import '../widget/items_details/item_details/fav_counter_section.dart';
import '../widget/items_details/item_details/item_sliver_appbar.dart';
import '../widget/items_details/item_details/items_details_desc.dart';
import '../widget/items_details/item_details/title_price.dart';

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
                        Obx(() {
                          return controller.isLoading == true
                              ? Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Visibility(
                                  visible: controller.subItemsList.isNotEmpty,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SectionTitle(title: "weightSize"),
                                      GetBuilder<ItemDetailsControllerImpl>(
                                          builder: (controller) {
                                        return Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            ...List.generate(
                                                controller.subItemsList.length,
                                                (index) => GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .setSelectedWeightAndSize(
                                                                controller
                                                                        .subItemsList[
                                                                    index]);
                                                      },
                                                      child: Container(
                                                        height: 80,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        decoration: BoxDecoration(
                                                            color: controller
                                                                        .subItemsList[
                                                                            index]
                                                                        .subItemId ==
                                                                    controller
                                                                        .selectedSubItems
                                                                        ?.subItemId
                                                                ? Colors.red
                                                                : Colors.red
                                                                    .withOpacity(
                                                                        0.4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        5.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  translateDatabase(
                                                                      controller
                                                                          .subItemsList[
                                                                              index]
                                                                          .subItemsNameAr!,
                                                                      controller
                                                                          .subItemsList[
                                                                              index]
                                                                          .subItemsName!),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                            AutoSizeText(
                                                              "${(controller.subItemsList[index].subItemsPrice!).toStringAsFixed(2)} ${"d".tr}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                          ],
                                        );
                                      }),
                                    ],
                                  ));
                        }),
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
