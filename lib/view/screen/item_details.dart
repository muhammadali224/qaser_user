import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../controller/items_controller/item_details_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/constant/color.dart';
import '../../core/function/translate_database.dart';
import '../widget/items_details/item_details_header.dart';
import '../widget/items_details/items_details_desc.dart';
import '../widget/items_details/top_stack_details.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImpl controller = Get.put(ItemDetailsControllerImpl());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Container(
        //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 50,
        width: double.infinity,
        color: Colors.transparent,
        child: MaterialButton(
          color: AppColor.primaryColor,
          onPressed: controller.goToCart,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("goToCart".tr),
              const SizedBox(width: 10),
              const Icon(IconBroken.Buy)
            ],
          ),
        ),
      ),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              IconBroken.Arrow___Right_2,
              size: 30,
            ),
          ),
          title: Text(
            translateDatabase(controller.itemsModel.itemsNameAr!,
                controller.itemsModel.itemsName!),
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          )),
      body: GetBuilder<ItemDetailsControllerImpl>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const TopImagesSlider(),
              const SizedBox(height: 15),
              const ItemDetailsHeader(),
              const SizedBox(height: 15),
              ItemsDetailsDesc(
                  title: controller.itemsModel.itemsDesc!,
                  titleAr: controller.itemsModel.itemsDescAr!),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
