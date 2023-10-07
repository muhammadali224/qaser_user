import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../controller/favorite_controller/favorite_controller.dart';
import '../../controller/offers_controller/offers_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../widget/offers/custom_offer_list_item.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
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
              // CustomAppbar(
              //   isHome: false,
              //   title: 'findProduct',
              //   myController: controller.search!,
              //   onPressedSearch: () {
              //     controller.onSearchItems();
              //   },
              //   onChanged: (val) {
              //     controller.checkSearch(val);
              //     // controller.onSearchItems();
              //   },
              //   onPressedHome: () {
              //     controller.goToHome();
              //   },
              // ),
              const SizedBox(height: 15),
              // !controller.isSearch ? const ItemsCategoriesList() : Container(),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget:
                      // !controller.isSearch
                      //     ?
                      GridView.builder(
                          itemCount: controller.offersItems.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            return CustomOfferListItems(
                                itemsModel: controller.offersItems[index]);
                          })
                  // : SearchListResult(listData: controller.listSearchResult),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
