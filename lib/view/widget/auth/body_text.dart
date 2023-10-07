import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomBody extends StatelessWidget {
  final String bodyText;

  const CustomBody({Key? key, required this.bodyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        bodyText.tr,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColor.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
