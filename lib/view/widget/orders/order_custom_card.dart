import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/orders_model/orders_model.dart';
import 'custom_card/card_header.dart';
import 'custom_card/card_order_details_footer.dart';
import 'custom_card/card_total_container.dart';
import 'custom_card/card_type_time_branch.dart';
import 'custom_card/card_user_info.dart';

class OrdersCard extends GetView<OrdersController> {
  final OrdersModel ordersModel;

  const OrdersCard({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.ordersDetails, arguments: {
          'ordersModel': ordersModel,
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 13),
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
            OrderCardHeader(
                ordersModel: ordersModel,
                orderState: controller.orderStatus[ordersModel.ordersState!]!),
            CardTimeBranchTitle(
                ordersModel: ordersModel,
                orderType: controller.orderType[ordersModel.ordersType!]!),
            CardUserInfo(ordersModel: ordersModel),
            const SizedBox(height: 20),
            if (ordersModel.ordersState == 3 && ordersModel.ordersRating != 0)
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ratingDialog".tr,
                          style: TextStyle(
                              fontSize: 20, color: AppColor.primaryColor)),
                      Row(
                        children: [
                          Text(ordersModel.ordersRating.toString(),
                              style: TextStyle(
                                  fontSize: 20, color: AppColor.primaryColor)),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  )),
            CardTotalContainer(ordersModel: ordersModel),
            if (ordersModel.ordersState == 1) const Divider(),
            const Divider(),
            const OrdersCardFooter(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
