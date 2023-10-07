import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../controller/orders/rate_order_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../widget/rating/completed_list_card.dart';

class OrdersRating extends StatelessWidget {
  const OrdersRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RateOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("ratings".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconBroken.Arrow___Right_2,
            size: 30,
          ),
        ),
      ),
      body: GetBuilder<RateOrdersController>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CompletedListCard(
                ordersModel: controller.data[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}
