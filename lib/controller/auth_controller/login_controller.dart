import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/app.service.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/auth/login_data.dart';
import '../user_controller/user_controller.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToLoginWithSMS();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isVisiblePassword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  @override
  login() async {
    try {
      var formCurrent = formState.currentState;
      if (formCurrent!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await loginData.postData(email.text.trim(), password.text.trim());
        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            await UserController().clear();
            UserController().user = UserModel.fromJson(response["data"]);

            if (response['data']["users_approve"] == 1) {
              Get.toNamed(AppRoutes.home);
              FirebaseMessaging.instance
                  .subscribeToTopic("user${UserController().user.usersId}");
              FirebaseMessaging.instance.unsubscribeFromTopic("notSigned");
              FirebaseMessaging.instance.subscribeToTopic("signed");
              await myServices.getBox.write(GetBoxKey.isSigned, true);
            } else if (response['data']["users_approve"] == 0) {
              Get.toNamed(
                AppRoutes.verificationSignup,
                arguments: {
                  'email': email.text,
                },
              );
            }
          } else {
            Get.defaultDialog(
                title: 'attention'.tr,
                middleText: "emailOrPasswordError".tr,
                actions: [
                  ElevatedButton(
                      onPressed: () => Get.back(), child: Text('ok'.tr)),
                ]);
            statusRequest = StatusRequest.failed;
          }
        }
        update();
      }
    } catch (e) {
      throw Exception("Error Login : $e");
    }
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToLoginWithSMS() {
    Get.toNamed(AppRoutes.loginWithSMS);
  }

  // Future<User?> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await GoogleSignIn().signIn();
  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;
  //
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );
  //
  //       final UserCredential authResult =
  //           await FirebaseAuth.instance.signInWithCredential(credential);
  //       final User? user = authResult.user;
  //       return user;
  //     }
  //     return null;
  //   } catch (e) {
  //     throw Exception("Error _Sign in with Google: $e ");
  //   }
  // }
  //
  // Future<void> googleSignIn() async {
  //   try {
  //     User? user = await _signInWithGoogle();
  //
  //     if (user != null) {
  //       // Save user data to backend
  //       // await saveUserData(user.displayName ?? '', user.email ?? '');
  //       print(user);
  //     }
  //   } catch (e) {
  //     throw Exception("Google SignIn Error: $e");
  //   }
  // }
}
