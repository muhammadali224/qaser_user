import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/controller/home_controller/home_controller.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';

class ExpandFloating extends GetView<HomeControllerImp> {
  const ExpandFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: Icon(Icons.call),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
        child: Icon(Icons.close),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      type: ExpandableFabType.up,
      pos: controller.myServices.getBox.read(GetBoxKey.language) ==
              GetBoxKey.arLanguage
          ? ExpandableFabPos.left
          : ExpandableFabPos.right,
      overlayStyle: ExpandableFabOverlayStyle(blur: 3.1),
      children: [
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          heroTag: null,
          child: Brand(Brands.whatsapp, size: 50),
          onPressed: controller.launchWhatsApp,
        ),
        FloatingActionButton(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          heroTag: null,
          child: Icon(
            Icons.call,
            size: 35,
            color: Colors.white,
          ),
          onPressed: controller.launchCall,
        ),
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          heroTag: null,
          child: Brand(Brands.facebook, size: 50),
          onPressed: controller.launchFacebook,
        ),
      ],
    );
  }
}
