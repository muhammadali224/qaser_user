import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationsHelper {
  // prevent making instance
  AwesomeNotificationsHelper._();

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  /// initialize local notifications service, create channels and groups
  /// setup notifications button actions handlers
  static init() async {
    // initialize local notifications
    await _initNotification();

    // request permission to show notifications
    awesomeNotifications.requestPermissionToSendNotifications();

    // list when user click on notifications
    listenToActionButtons();
  }

  /// when user click on notification or click on button on the notification
  static listenToActionButtons() {
    // Only after at least the action method is set, the notification events are delivered
    awesomeNotifications.setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  ///init notifications channels
  static _initNotification() async {
    await AwesomeNotifications().setLocalization(
        languageCode: await AwesomeNotifications().getLocalization());
    await awesomeNotifications.initialize(
        "resource://drawable/app_icon",
        // null mean it will show app icon on the notification (status bar)
        [
          NotificationChannel(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            channelName: NotificationChannels.generalChannelName,
            groupKey: NotificationChannels.generalGroupKey,
            channelDescription: NotificationChannels.generalChannelDescription,
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            enableVibration: true,
            playSound: true,
            importance: NotificationImportance.Max,
            vibrationPattern: Int64List.fromList([0, 1000, 5000, 2000]),
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelGroupName: NotificationChannels.generalChannelGroupName,
          ),
        ],
        languageCode: "ar");
  }

  //display notification for user with sound
  static showNotification(
      {required String title,
      required String body,
      required int id,
      String? summary,
      Map<String, String>? payload,
      String? largeIcon}) async {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      } else {
        // u can show notification
        awesomeNotifications.createNotification(
          content: NotificationContent(
            id: id,
            title: title,
            body: body,
            groupKey: NotificationChannels.generalGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            showWhen: true,
            // Hide/show the time elapsed since notification was displayed
            payload: payload,
            // data of the notification (it will be used when user clicks on notification)
            notificationLayout: NotificationLayout.Default,
            // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
            autoDismissible: true,
            // dismiss notification when user clicks on it
            summary: summary,
            wakeUpScreen: true,
            // category: NotificationCategory.Transport,
            // for ex: New message (it will be shown on status bar before notificaiton shows up)
            largeIcon:
                largeIcon, // image of sender for ex (when someone send you message his image will be shown)
          ),
        );
      }
    });
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Map<String, String?>? payload = receivedAction.payload;
    // TODO handle clicking on notification
    // example
    // String routeToGetTo = payload['route'];
    // normal navigation (Get.toNamed) will throw error

    // Get.key.currentState?.pushNamed(AppRoutes.home);
  }
}

class NotificationChannels {
  // general channel (for all other notifications)
  static String get generalChannelKey => "general_channel";

  static String get generalGroupKey => "general group key";

  static String get generalChannelGroupKey => "general_channel_group";

  static String get generalChannelGroupName => "general notifications channel";

  static String get generalChannelName => "general notifications channels";

  static String get generalChannelDescription =>
      "Notification channel for general notifications";
}
