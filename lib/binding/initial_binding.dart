import 'package:get/get.dart';
import 'package:qaser_user/controller/home_controller/timer_controller.dart';
import 'package:qaser_user/controller/user_controller/user_controller.dart';

import '../controller/network_controller/network_controller.dart';
import '../core/class/crud.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put(CRUD(), permanent: true);
    Get.put(TimerController(), permanent: true);
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
