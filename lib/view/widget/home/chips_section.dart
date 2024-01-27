import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/controller/home_controller/home_controller.dart';

class ChipsSection extends GetView<HomeControllerImp> {
  const ChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ActionChip(
            onPressed: controller.goToMyPoint,
            labelStyle: TextStyle(color: Colors.black),
            label: AutoSizeText("myPoints".tr),
            avatar: Icon(
              FontAwesome.award_solid,
              color: Colors.teal,
            ),
          ),
        ),
        Expanded(
          child: ActionChip(
            onPressed: controller.goToAwards,
            avatar: Icon(
              FontAwesome.crown_solid,
              color: Colors.amber,
            ),
            labelStyle: TextStyle(color: Colors.black),
            label: AutoSizeText("rewards".tr),
          ),
        ),
        Expanded(
          child: ActionChip(
            onPressed: controller.goToFavorite,
            labelStyle: TextStyle(color: Colors.black),
            label: AutoSizeText("favorite".tr),
            avatar: Icon(
              FontAwesome.star_solid,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
