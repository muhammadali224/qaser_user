import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller/cart_controller.dart';
import '../../data/shared/branches.dart';
import '../../view/widget/cart/checkout_location.dart';
import '../../view/widget/cart/checkout_title.dart';
import '../constant/routes.dart';
import 'get_polyline.dart';

openLocationBottomSheet() {
  CartControllerImp controller = Get.find();

  return Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      height: Get.height / 2,
      width: double.infinity,
      child: ListView(
        children: [
          const CheckoutTitle(title: 'chooseLocation'),
          controller.addressController.data.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                        controller.addressController.data.length,
                        (index) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: CheckoutLocation(
                                addressModel:
                                    controller.addressController.data[index],
                                onTap: () async {
                                  Get.back();
                                  await controller.selectLocationDeliver(index);
                                  SmartDialog.showLoading(
                                      msg: "calculateDelivery".tr);
                                  await getDistance(
                                    lat2: controller
                                        .addressController
                                        .data[controller.locationList]
                                        .addressLat!,
                                    lon2: controller
                                        .addressController
                                        .data[controller.locationList]
                                        .addressLong!,
                                    lat1: selectedBranch.branchLat!,
                                    lon1: selectedBranch.branchLang!,
                                  );
                                  controller.distance = double.parse(dest!);
                                  await controller.calculateDeliveryCharge();
                                  SmartDialog.dismiss();
                                },
                              ),
                            )),
                    Center(
                      child: TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.addressAdd),
                          child: Text(
                            "goToLocation".tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "noLocation".tr,
                      style: const TextStyle(fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.addressAdd);
                        },
                        child: Text(
                          "goToLocation".tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
        ],
      ),
    ),
    elevation: 10,
  );
}
