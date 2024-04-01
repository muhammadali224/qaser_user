import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/app.service.dart';
import 'package:qaser_user/data/model/user_point_model/user_point_model.dart';
import 'package:qaser_user/data/source/remote/user_point_data/user_point_data.dart';

import '../user_controller/user_controller.dart';

class TimerController extends GetxController {
  RxBool canGetPrize = true.obs;
  RxString eta = ''.obs;
  final box = Get.find<MyServices>().getBox;
  UserPointData _pointData = UserPointData(Get.find());
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    canGetPrize.value = box.read(GetBoxKey.canGetPrize) ?? true;
    _loadTimerState();

    super.onInit();
  }

  Future<void> _loadTimerState() async {
    try {
      String? nextPrize = await box.read(GetBoxKey.nextPrizeTime);

      if (nextPrize != null) {
        DateTime? nextPrizeTime = DateTime.parse(nextPrize);

        DateTime now = DateTime.now();

        if (now.isAfter(nextPrizeTime)) {
          canGetPrize.value = true;
          await box.write(GetBoxKey.canGetPrize, true);
        } else {
          _startEtaTimer(nextPrizeTime);
        }
      }

      update();
    } catch (e) {
      throw Exception("Error Load Timer $e");
    }
  }

  void getPrize() async {
    try {
      isLoading.value = true;
      if (UserController().user.usersIsAnonymous == 1) {
        SmartDialog.showToast("signInFirst".tr);
        isLoading.value = false;
      } else {
        var response = await _pointData.addPoint(
            UserController().user.usersId!,
            UserPointModel(
              pointDescreption: "المكافئة اليومية",
              pointDescreptionEn: "Daily Prize",
              pointsCount: 5,
            ));

        if (response["status"] == "success") {
          DateTime nextPrizeTime = DateTime.now().add(Duration(days: 1));
          box.write(GetBoxKey.nextPrizeTime, nextPrizeTime.toString());

          // User can get the prize now
          canGetPrize.value = false;
          await box.write(GetBoxKey.canGetPrize, false);
          // Start ETA timer
          _startEtaTimer(nextPrizeTime);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          SmartDialog.showToast("somethingError".tr);
        }
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception("Error Get Prize $e");
    }
    update();
  }

  void _startEtaTimer(DateTime targetTime) {
    try {
      Timer.periodic(Duration(seconds: 1), (Timer t) async {
        DateTime now = DateTime.now();
        Duration difference = targetTime.difference(now);

        if (difference.isNegative) {
          t.cancel();
          canGetPrize.value = true;
          await box.write(GetBoxKey.canGetPrize, true);
          eta.value = '';
          box.remove(GetBoxKey.nextPrizeTime);
        } else {
          eta.value = _formatDuration(difference);
        }
      });
    } catch (e) {
      throw Exception("Error Start ETA Timer $e");
    }
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    int seconds = (duration.inSeconds % 60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // rmove() {
  //   canGetPrize.value = true;
  //   eta.value = '';
  //   box.remove(GetBoxKey.nextPrizeTime);
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
