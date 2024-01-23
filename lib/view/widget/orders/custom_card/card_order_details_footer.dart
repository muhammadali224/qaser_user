import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersCardFooter extends StatelessWidget {
  const OrdersCardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ordersDetails".tr,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          Icon(Icons.arrow_right,
              color: Theme.of(context).primaryColor, size: 35),
        ],
      ),
    );
  }
}
