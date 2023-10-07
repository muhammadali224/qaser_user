import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImpl
    extends SuccessResetPasswordController {
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
