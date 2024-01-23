import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/function/copy_text.dart';
import '../../../../data/model/orders_model/orders_model.dart';

class OrderCardHeader extends StatelessWidget {
  final OrdersModel ordersModel;
  final String orderState;

  const OrderCardHeader(
      {super.key, required this.ordersModel, required this.orderState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            orderState.tr,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.red),
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
    );
  }
}
