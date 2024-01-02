import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/app.service.dart';
import 'package:qaser_user/data/model/user_point_model/user_point_model.dart';
import 'package:qaser_user/data/source/remote/user_point_data/user_point_data.dart';

import '../../data/model/user_model/user_model.dart';
import '../user_controller/user_controller.dart';

class TimerController extends GetxController {
  RxBool canGetPrize = true.obs;
  RxString eta = ''.obs;
  Rx<UserModel> user = Get.find<UserController>().user.obs;
  final box = Get.find<MyServices>().getBox;
  UserPointData _pointData = UserPointData(Get.find());

  @override
  void onInit() {
    // box.remove(GetBoxKey.canGetPrize);
    canGetPrize.value = box.read(GetBoxKey.canGetPrize) ?? true;
    _loadTimerState();
    // rmove();
    super.onInit();
  }

  Future<void> _loadTimerState() async {
    try {
      String? nextPrize = await box.read(GetBoxKey.nextPrizeTime);

      if (nextPrize != null) {
        DateTime? nextPrizeTime = DateTime.parse(nextPrize);

        DateTime now = DateTime.now();

        if (now.isAfter(nextPrizeTime)) {
          // User can get the prize now
          canGetPrize.value = true;
          await box.write(GetBoxKey.canGetPrize, true);
        } else {
          // Calculate ETA
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
      if (user.value.usersIsAnonymous == 1) {
        SmartDialog.showToast("signInFirst".tr);
      } else {
        var response = await _pointData.addPoint(
            user.value.usersId!,
            UserPointModel(
              createDate: DateTime.now(),
              expireDate: DateTime.now().add(Duration(days: 90)),
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
        } else {
          SmartDialog.showToast("somethingError".tr);
        }
      }
    } catch (e) {
      throw Exception("Error Get Prize $e");
    }
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
