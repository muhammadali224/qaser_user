import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qaser_user/core/class/status_request.dart';
import 'package:qaser_user/data/source/remote/awards_data/awards_data.dart';
import 'package:qaser_user/generated/assets.dart';

import '../../core/function/handling_data_controller.dart';
import '../../core/services/encrypt.service.dart';
import '../../data/model/awards_model/awards_model.dart';
import '../user_controller/user_controller.dart';

class AwardsController extends GetxController {
  AwardsData _awardsData = AwardsData(Get.find());
  UserController userController = Get.find<UserController>();
  List<AwardsModel> awardsList = [];
  StatusRequest statusRequest = StatusRequest.none;
  int totalPoint = 0;
  QrImage? qrImage;
  final RxString qrCodeData = ''.obs;

  Future<void> getAwards() async {
    try {
      awardsList.clear();
      statusRequest = StatusRequest.loading;

      update();
      var response =
          await _awardsData.getAwardsView(userController.user.usersId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          totalPoint = response['total_valid_points'];
          List responseData = response['data']["data"];
          awardsList.addAll(responseData.map((e) => AwardsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception("Error Get Awards : $e");
    }
    update();
  }

  void generateQRCode(String id) {
    String planText = "$id|${userController.user.usersId}";
    Encrypted encrypted = EncryptData.encryptWithAES(planText);
    String encryptedData = encrypted.base64;
    qrCodeData.value = encryptedData;
  }

  showQRCode(int id) {
    generateQRCode(id.toString());
    final qrCode = QrCode(
      8,
      QrErrorCorrectLevel.H,
    )..addData("${qrCodeData.value}");

    qrImage = QrImage(qrCode);
    SmartDialog.show(
        builder: (_) => Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: PrettyQrView(
                qrImage: qrImage!,
                decoration: const PrettyQrDecoration(
                    image: PrettyQrDecorationImage(
                        image: AssetImage(Assets.imagesLogo2))),
              ),
            ));
  }

  @override
  void onInit() async {
    await Jiffy.setLocale("ar");
    getAwards();
    super.onInit();
  }
}
