import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomHeader extends StatelessWidget {
  final String headerText;
  const CustomHeader({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText.tr,
      style: Theme.of(context).textTheme.displayLarge,
      textAlign: TextAlign.center,
    );
  }
}
