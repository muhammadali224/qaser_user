import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomSigninText extends StatelessWidget {
  final String account;
  final String sign;
  final Function()? onTap;

  const CustomSigninText(
      {Key? key, required this.account, required this.sign, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(account.tr),
        InkWell(
            onTap: onTap,
            child: Text(
              sign.tr,
              style: TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
