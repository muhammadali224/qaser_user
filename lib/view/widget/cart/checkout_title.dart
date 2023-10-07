import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutTitle extends StatelessWidget {
  final String title;
  const CheckoutTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Text(
        title.tr,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
