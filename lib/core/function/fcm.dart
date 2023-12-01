// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:get/get.dart';
//
// import '../../controller/orders/orders_controller.dart';
//
// fcmConfig() {
//   FirebaseMessaging.onMessage.listen((message) {
//     FlutterRingtonePlayer().playNotification();
//     Get.snackbar(
//       message.notification!.title!.tr,
//       message.notification!.body!.tr,
//       icon: const Icon(Icons.notifications_active_outlined),
//     );
//     refreshPageNotification(message.data);
//   });
// }
//
// refreshPageNotification(data) {
//   if (data['pagename'] == 'orders' && Get.currentRoute == '/orders') {
//     OrdersController controller = Get.find();
//
//     controller.refreshOrders();
//   }
// }
//
// requestNotificationPermissions() async {
//   // NotificationSettings setting =
//   await FirebaseMessaging.instance.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
// }
