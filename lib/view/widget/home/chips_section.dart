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
        ActionChip(
          onPressed: controller.goToMyPoint,
          labelStyle: TextStyle(color: Colors.black),
          label: Text("myPoints".tr),
          avatar: Icon(
            FontAwesome.award_solid,
            color: Colors.teal,
          ),
        ),
        ActionChip(
          onPressed: () {},
          avatar: Icon(
            FontAwesome.crown_solid,
            color: Colors.amber,
          ),
          labelStyle: TextStyle(color: Colors.black),
          label: Text("rewards".tr),
        ),
        ActionChip(
          onPressed: controller.goToFavorite,
          labelStyle: TextStyle(color: Colors.black),
          label: Text("favorite".tr),
          avatar: Icon(
            FontAwesome.star_solid,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
