import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qaser_user/core/class/status_request.dart';
import 'package:qaser_user/data/source/remote/awards_data/awards_data.dart';
import 'package:qaser_user/generated/assets.dart';

import '../../core/function/handling_data_controller.dart';
import '../../data/model/awards_model/awards_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../user_controller/user_controller.dart';

class AwardsController extends GetxController {
  AwardsData _awardsData = AwardsData(Get.find());
  Rx<UserModel> user = Get.find<UserController>().user.obs;
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
      var response = await _awardsData.getAwardsView(user.value.usersId!);
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
    String productId = id;
    DateTime dateTime = DateTime.now();
    String encryptedData = _encryptData(productId, dateTime);
    qrCodeData.value = encryptedData;
  }

  String _encryptData(String productId, DateTime dateTime) {
    final key = utf8.encode('qaser_sharqi'); // Replace with your secret key
    final bytes = utf8.encode('$productId|${dateTime.toIso8601String()}');
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return base64Encode(Uint8List.fromList(digest.bytes));
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
  void onInit() {
    getAwards();
    super.onInit();
  }
}
