import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TimerController extends GetxController {
  RxInt secondsRemaining = 0.obs;
  int totalSeconds = 24 * 60 * 60; // 24 hours in seconds

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadTimerState();
  }

  Future<void> _loadTimerState() async {
    int savedTimestamp = box.read('prizeTimestamp') ?? 0;

    if (savedTimestamp > 0) {
      DateTime savedDateTime =
          DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
      DateTime currentDateTime = DateTime.now();

      Duration difference = currentDateTime.difference(savedDateTime);

      if (difference.inSeconds < totalSeconds) {
        // Calculate remaining time
        secondsRemaining.value = totalSeconds - difference.inSeconds;

        // Start the timer
        startTimer();
      } else {
        // If the elapsed time is greater than or equal to the total seconds, clear the saved timestamp
        await _clearTimerState();
      }
    }
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer t) async {
      if (secondsRemaining.value == 0) {
        t.cancel(); // Stop the timer when countdown reaches 0
        await _clearTimerState();
      } else {
        secondsRemaining--;

        await _saveTimerState();
      }
    });
  }

  Future<void> _saveTimerState() async {
    box.write('secondsRemaining', secondsRemaining.value);
  }

  Future<void> _clearTimerState() async {
    box.remove('prizeTimestamp');
    box.remove('secondsRemaining');
  }

  String getEta() {
    int hours = (secondsRemaining.value / 3600).floor();
    int minutes = ((secondsRemaining.value % 3600) / 60).floor();
    int seconds = secondsRemaining.value % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
