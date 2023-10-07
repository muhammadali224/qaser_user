import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersTabStatus extends StatelessWidget {
  final String title;
  final IconData icon;
  const OrdersTabStatus({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 7),
          Text(title.tr),
        ],
      ),
    );
  }
}
