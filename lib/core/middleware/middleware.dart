import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/get_box_key.dart';
import '../constant/routes.dart';
import '../services/app.service.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.getBox.read(GetBoxKey.step) == "1") {
      return const RouteSettings(name: AppRoutes.splashScreen);
    }
    if (myServices.getBox.read(GetBoxKey.step) == "2") {
      return const RouteSettings(name: AppRoutes.login);
    }

    return null;
  }
}
