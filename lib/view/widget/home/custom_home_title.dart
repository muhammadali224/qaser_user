import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/get_box_key.dart';

class CustomHomeTitle extends GetView<HomeControllerImp> {
  final String title;

  final bool? withSeeAll;
  final void Function()? seeAllOnPressed;

  const CustomHomeTitle({
    super.key,
    required this.title,
    this.withSeeAll = false,
    this.seeAllOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    var lang = controller.myServices.getBox.read(GetBoxKey.language)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title.tr,
            style: TextStyle(
                color: AppColor.fourthColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          if (withSeeAll == true)
            Row(
              children: [
                TextButton(
                  onPressed: seeAllOnPressed,
                  child: Row(
                    children: [
                      Text('seeAll'.tr, style: const TextStyle(fontSize: 20)),
                      Icon(lang == 'ar'
                          ? IconBroken.Arrow___Left
                          : IconBroken.Arrow___Right),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
