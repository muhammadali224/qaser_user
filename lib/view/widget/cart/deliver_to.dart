import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller/cart_controller.dart';
import '../../../core/constant/routes.dart';

class DeliverTo extends StatelessWidget {
  const DeliverTo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      if (controller.addressController.data.isNotEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "deliverTo".tr,
                    style: const TextStyle(color: Colors.black, fontSize: 19),
                  )),
              ListTile(
                title: Text(
                    controller.addressController.data[controller.locationList]
                        .addressName!,
                    style: const TextStyle(fontSize: 18)),
                subtitle: Text(
                    "${controller.addressController.data[controller.locationList].addressCity!} ,${controller.addressController.data[controller.locationList].addressStreet!}"),
              )
            ],
          ),
        );
      } else {
        return Column(
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
        );
      }
    });
  }
}
