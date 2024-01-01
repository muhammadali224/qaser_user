import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/favorite_controller/my_favorite_controller.dart';
import '../../../controller/items_controller/items_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/back_appbar.dart';
import '../../widget/items/custom_list_items.dart';
import '../../widget/items/list_items_categories.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    MyFavoriteController favController = Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'.tr),
        leading: BackAppBar(),
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
      ),
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const ItemsCategoriesList(),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    itemCount: controller.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      favController
                              .isFavorite[controller.items[index].itemsId] =
                          controller.items[index].isFavorite;
                      return CustomListItems(
                        itemsModel: controller.items[index],
                        onTap: () =>
                            controller.goToDetails(controller.items[index]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
