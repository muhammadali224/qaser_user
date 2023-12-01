import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/controller/home_controller/home_controller.dart';

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
      pos: ExpandableFabPos.left,
      overlayStyle: ExpandableFabOverlayStyle(blur: 3.1),
      children: [
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          heroTag: null,
          child: Logo(Logos.whatsapp, size: 50),
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
          child: Logo(Logos.facebook_logo, size: 50),
          onPressed: controller.launchFacebook,
        ),
      ],
    );
  }
}
