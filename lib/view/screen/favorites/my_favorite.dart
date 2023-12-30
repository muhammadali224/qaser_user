import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller/my_favorite_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/back_appbar.dart';
import '../../widget/my_favorite/custom_list_favorite_items.dart';

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
                        return CustomListFavoriteItems(
                            itemsModel: controller.favData[index]);
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
