import 'package:get/get.dart';
import 'package:qaser_user/core/constant/routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.home);
    super.onInit();
  }
}
