import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogin();
}

class SuccessSignUpControllerImpl extends SuccessSignUpController {
  String? email;
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
