import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;

  const CustomAuthButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        color: color ?? AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          text.tr,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
