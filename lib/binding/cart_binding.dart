import 'package:get/get.dart';

import '../controller/cart_controller/cart_controller.dart';
import '../core/class/crud.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
    Get.put(CartControllerImp());
  }
}
