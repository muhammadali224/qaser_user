import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../data/model/orders_model/orders_model.dart';

class CardTotalContainer extends StatelessWidget {
  final OrdersModel ordersModel;
  const CardTotalContainer({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("total".tr,
                style: TextStyle(fontSize: 20, color: AppColor.red)),
            Text("${ordersModel.ordersTotalPrice} ${"jd".tr}",
                style: TextStyle(fontSize: 20, color: AppColor.red)),
          ],
        ));
  }
}
