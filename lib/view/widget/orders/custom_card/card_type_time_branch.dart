import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/function/translate_database.dart';
import '../../../../data/model/orders_model/orders_model.dart';

class CardTimeBranchTitle extends StatelessWidget {
  final OrdersModel ordersModel;
  final String orderType;

  const CardTimeBranchTitle(
      {super.key, required this.ordersModel, required this.orderType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            orderType.tr,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            translateDatabase(
                ordersModel.branchNameAr!, ordersModel.branchNameEn!),
            style: const TextStyle(fontSize: 18),
          ),
          Text(Jiffy.parseFromDateTime(ordersModel.ordersTime!).fromNow(),
              style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
