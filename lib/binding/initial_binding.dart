import 'package:get/get.dart';

import '../controller/network_controller/network_controller.dart';
import '../core/class/crud.dart';
import '../core/services/user_preference.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD(), permanent: true);
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<UserPreferences>(UserPreferences(), permanent: true);
  }
}
