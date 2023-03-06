import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:notifications_system/app/routes/app_pages.dart';
import 'package:notifications_system/services/local_notification.dart';

class NotificationController extends ChangeNotifier {
  static final NotificationController _instance =
      NotificationController._internal();

  factory NotificationController() {
    return _instance;
  }

  NotificationController._internal();

  static Future<void> initializeLocalNotifications(
      {required bool debug}) async {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notitfications for basic tests',
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Secret,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          enableVibration: true,
          channelShowBadge: true,
          enableLights: true,
          icon: 'resource://drawable/res_logomain',
        ),
        NotificationChannel(
          channelGroupKey: 'chats_group',
          channelKey: 'chats',
          channelName: 'Basic Notifications',
          channelDescription: 'Notitfications for basic tests',
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Secret,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          enableVibration: true,
          channelShowBadge: true,
          enableLights: true,
          icon: 'resource://drawable/res_logomain',
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group'),
        NotificationChannelGroup(
            channelGroupKey: 'chats_group', channelGroupName: 'Chat group')
      ],
      debug: debug,
    );
  }

  static Future<void> initializeLocalNotificationsListeners() async {
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    bool isSilentAction =
        receivedAction.actionType == ActionType.SilentAction ||
            receivedAction.actionType == ActionType.SilentBackgroundAction;

// Fluttertoast.showToast(
//         msg: isSilentAction ? 'Silent Action' : 'Action',
//         toastLength: Toast.LENGTH_SHORT,
//         backgroundColor: Colors.black,
//         gravity: ToastGravity.BOTTOM);
    print('receivedAction ${receivedAction.toString()}');

    if (receivedAction.channelKey == 'chats') {
      reciveChatNotificationAction(receivedAction);
    }

    if (receivedAction.buttonKeyPressed == 'SUBSCRIBE') {
      Fluttertoast.showToast(
          msg: 'SUBSCRIBE',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM);
    } else if (receivedAction.buttonKeyPressed == 'DISMISS') {
      Fluttertoast.showToast(
          msg: 'DISMISS',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM);
    }
  }

  static Future<void> reciveChatNotificationAction(
      ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'REPLY') {
      await LocalNotifications.createMessagingNotification(
          channelKey: 'chats',
          groupKey: receivedAction.groupKey!,
          chatName: receivedAction.summary!,
          username: 'You',
          message: receivedAction.buttonKeyInput);
    } else {
      Get.toNamed(Routes.CHAT);
    }
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('Notification Created');

    Fluttertoast.showToast(
        msg: 'Notification Created',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        gravity: ToastGravity.BOTTOM);
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('Notification Displayed');

    Fluttertoast.showToast(
        msg: 'Notification Displayed',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        gravity: ToastGravity.BOTTOM);
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('Notification Dismiss');

    Fluttertoast.showToast(
        msg: 'Notification Dismiss',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black,
        gravity: ToastGravity.BOTTOM);
  }
}
