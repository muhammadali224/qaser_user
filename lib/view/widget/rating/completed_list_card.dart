import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../../controller/orders/rate_order_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/copy_text.dart';
import '../../../core/shared/rate_dialog.dart';
import '../../../data/model/orders_model.dart';

class CompletedListCard extends GetView<RateOrdersController> {
  final OrdersModel ordersModel;

  const CompletedListCard({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Container(
      height: 280,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${controller.orderStatus[ordersModel.ordersState.toString()]}"
                      .tr,
                  style: TextStyle(color: AppColor.primaryColor, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      "#${ordersModel.ordersId.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          copyText(ordersModel.ordersId.toString());
                        },
                        icon: Icon(
                          Icons.copy_all_outlined,
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${controller.orderType[ordersModel.ordersType.toString()]}"
                      .tr,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  Jiffy.parse(ordersModel.ordersTime!).fromNow(),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),

          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("total".tr,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primaryColor)),
                  Text("${ordersModel.ordersTotalPrice} ${"jd".tr}",
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primaryColor)),
                ],
              )),
          const Divider(),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.ordersDetails,
                  arguments: {'ordersModel': ordersModel});
            },
            child: ListTile(
              title: Text(
                "ordersDetails".tr,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward,
                  color: Theme.of(context).primaryColor, size: 35),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                showRatingDialog(context, ordersModel.ordersId!);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "${"rate".tr}${'order'.tr}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
