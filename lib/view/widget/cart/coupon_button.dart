import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponButton extends StatelessWidget {
  final void Function() onPressed;
  const CouponButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: Colors.red,
        onPressed: onPressed,
        child: AutoSizeText(
          "apply".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
