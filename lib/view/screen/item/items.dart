import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:qaser_user/core/constant/color.dart';
import 'package:qaser_user/core/function/translate_database.dart';

import '../../../controller/favorite_controller/my_favorite_controller.dart';
import '../../../controller/items_controller/items_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/items/custom_list_items.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    MyFavoriteController favController = Get.put(MyFavoriteController());
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              new SliverAppBar(
                title: Text('categories'.tr),
                pinned: true,
                elevation: 50,
                floating: true,
                stretch: true,
                shadowColor: AppColor.primaryColor,
                // collapsedHeight: 70,
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.goToFavorite();
                      favController.getFavorite();
                    },
                    icon: const Icon(
                      IconBroken.Heart,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
                bottom: TabBar(
                  controller: controller.tabController,
                  onTap: (val) async {
                    await controller
                        .getData(controller.categories[val].categoriesId!);
                  },
                  tabAlignment: TabAlignment.center,
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 20, fontFamily: "Almarai"),
                  tabs: controller.categories
                      .map((e) => Tab(
                            text: translateDatabase(
                              e.categoriesNameAr!,
                              e.categoriesName!,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ];
          },
          body: GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: TabBarView(
                    controller: controller.tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: controller.categories
                        .map((e) => ListView(
                              shrinkWrap: true,
                              children: [
                                GridView.builder(
                                    itemCount: controller.items.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.7),
                                    itemBuilder: (context, index) {
                                      favController.isFavorite[
                                              controller.items[index].itemsId] =
                                          controller.items[index].isFavorite;
                                      return CustomListItems(
                                        itemsModel: controller.items[index],
                                        onTap: () => controller.goToDetails(
                                            controller.items[index]),
                                        heroTag: 'items',
                                      );
                                    }),
                              ],
                            ))
                        .toList()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
