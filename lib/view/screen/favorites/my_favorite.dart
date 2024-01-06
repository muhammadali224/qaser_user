import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller/my_favorite_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/back_appbar.dart';
import '../../widget/items/custom_list_items.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
        appBar: AppBar(
          title: Text("favorite".tr),
          leading: BackAppBar(),
        ),
        body: GetBuilder<MyFavoriteController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      itemCount: controller.favData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        controller
                                .isFavorite[controller.favData[index].itemsId] =
                            controller.favData[index].isFavorite;
                        return CustomListItems(
                          itemsModel: controller.favData[index],
                          onTap: () =>
                              controller.goToDetails(controller.favData[index]),
                          heroTag: 'favorite',
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
