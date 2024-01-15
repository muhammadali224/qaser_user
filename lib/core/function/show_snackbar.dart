import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String message, {Color? color, Widget? widget}) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          widget ?? Container(),
        ],
      ),
      elevation: 10,
      backgroundColor: color,
    ),
  );
}
