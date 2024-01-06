import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';

import 'awesome_helper.service.dart';

class FcmHelper {
  // prevent making instance
  FcmHelper._();

  // FCM Messaging
  static late FirebaseMessaging messaging;

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      // initialize firebase
      messaging = FirebaseMessaging.instance;

      // notification settings handler
      await _setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      await _generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      // Logger().e(error);
      throw Exception("error $error");
    }
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  static Future<void> _generateFcmToken() async {
    try {
      await GetStorage.init();
      GetStorage getBox = GetStorage();
      var token = await messaging.getToken();
      if (token != null) {
        getBox.write(GetBoxKey.fcmToken, token);

        _sendFcmTokenToServer();
      } else {
        // retry generating token
        await Future.delayed(const Duration(seconds: 5));
        _generateFcmToken();
      }
    } catch (error) {
      throw Exception("error $error");
    }
  }

  /// this method will be triggered when the app generate fcm
  /// token successfully
  static _sendFcmTokenToServer() async {
    await GetStorage.init();
    GetStorage getBox = GetStorage();
    getBox.read(GetBoxKey.fcmToken);
    // TODO SEND FCM TOKEN TO SERVER
  }

  ///handle fcm notification when app is closed/terminated
  /// if you are wondering about this annotation read the following
  /// https://stackoverflow.com/a/67083337
  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    print(message.contentAvailable);
    print(message.data);
    print(message.from);
    print(message.messageId);
    print(message.messageType);
    print(message.mutableContent);
    print(message.notification);
    print(message.senderId);
    print(message.sentTime);
    print(message.threadId);
    print(message.ttl);

    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification!.title!,
      body: message.notification!.body!,
      summary: message.notification!.title,
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    print(message.contentAvailable);
    print(message.data);
    print(message.from);
    print(message.messageId);
    print(message.messageType);
    print(message.mutableContent);
    print(message.notification);
    print(message.senderId);
    print(message.sentTime);
    print(message.threadId);
    print(message.ttl);

    AwesomeNotificationsHelper.showNotification(
      id: 1,
      summary: message.notification!.title!,
      title: message.notification!.title!,
      body: message.notification!.body!,
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
  }
}
