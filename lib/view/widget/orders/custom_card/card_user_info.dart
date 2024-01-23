import 'package:flutter/material.dart';

import '../../../../data/model/orders_model/orders_model.dart';

class CardUserInfo extends StatelessWidget {
  final OrdersModel ordersModel;

  const CardUserInfo({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ordersModel.usersName!,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            ordersModel.usersPhone!,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
