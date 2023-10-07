import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSubTitleText extends StatelessWidget {
  final String title;
  final String price;
  const CustomSubTitleText(
      {super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${title.tr} :",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            price,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
