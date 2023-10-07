import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/copy_text.dart';
import '../../../core/function/translate_database.dart';
import '../../../core/shared/rate_dialog.dart';
import '../../../data/model/orders_model.dart';

class OrdersCard extends GetView<OrdersController> {
  final OrdersModel ordersModel;

  const OrdersCard({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.ordersDetails,
            arguments: {'ordersModel': ordersModel});
      },
      child: Container(
        height: 270,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${controller.orderStatus[ordersModel.ordersState.toString()]}"
                        .tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.red),
                  ),
                  Row(
                    children: [
                      Text(
                        "#${ordersModel.ordersId.toString()}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            copyText(ordersModel.ordersId.toString());
                          },
                          icon: const Icon(
                            Icons.copy_all_outlined,
                            color: Colors.blue,
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
                  Text(Jiffy.parse(ordersModel.ordersTime!).fromNow(),
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(translateDatabase(
                    ordersModel.branchNameAr!, ordersModel.branchNameEn!))),
            if (ordersModel.ordersState == "3" &&
                ordersModel.ordersRating != "0")
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
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(ordersModel.ordersRating!,
                              style: TextStyle(
                                  fontSize: 20, color: AppColor.primaryColor)),
                        ],
                      ),
                    ],
                  )),
            if (ordersModel.ordersState == "3" &&
                ordersModel.ordersRating == "0")
              TextButton(
                  onPressed: () {
                    showRatingDialog(context, ordersModel.ordersId!,
                        isOrderScreen: true);
                  },
                  child: Text("${"rate".tr}${"order".tr}",
                      style: const TextStyle(
                          fontSize: 20, decoration: TextDecoration.underline))),
            const Spacer(),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("total".tr,
                        style: TextStyle(fontSize: 20, color: AppColor.red)),
                    Text("${ordersModel.ordersTotalPrice} ${"jd".tr}",
                        style: TextStyle(fontSize: 20, color: AppColor.red)),
                  ],
                )),
            const Divider(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ordersDetails".tr,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  ),
                  Icon(IconBroken.Arrow___Right_Circle,
                      color: Theme.of(context).primaryColor, size: 35),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
