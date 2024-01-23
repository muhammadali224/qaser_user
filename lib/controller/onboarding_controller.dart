import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/user_controller/user_controller.dart';

import '../core/constant/get_box_key.dart';
import '../core/constant/routes.dart';
import '../core/services/app.service.dart';
import '../data/model/user_model/user_model.dart';
import '../data/source/remote/auth/login_data.dart';
import '../data/source/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  final LoginData _loginData = LoginData(Get.find());

  Future<void> loginAnonymous() async {
    try {
      var response = await _loginData.loginAnonymous(
        UserController().user.usersEmail!,
        UserController().user.userFavBranchId!,
        UserController().user.usersName!,
      );
      if (response['status'] == 'success') {
        UserModel loginUser = UserModel.fromJson(response['data']);
        print(loginUser.toString());
        UserController().user = loginUser;
      }
    } catch (e) {
      throw Exception("Error OnBoarding Login Anon : $e");
    }
    update();
  }

  @override
  void onInit() async {
    pageController = PageController();
    if (myServices.getBox.read(GetBoxKey.isSigned) != true) {
      await loginAnonymous();
    }

    super.onInit();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      myServices.getBox.write(GetBoxKey.step, "1");
      Get.offAllNamed(AppRoutes.home);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
