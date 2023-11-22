import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../controller/favorite_controller/my_favorite_controller.dart';
import '../../controller/offers_controller/offers_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../widget/items/custom_list_items.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(MyFavoriteController());
    // Get.put(ItemsControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("offers".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconBroken.Arrow___Right_2,
            size: 30,
          ),
        ),
      ),
      body: GetBuilder<OffersController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const SizedBox(height: 15),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    itemCount: controller.offersItems.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return CustomListItems(
                          itemsModel: controller.offersItems[index]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
