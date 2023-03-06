import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

int creatUniqueID(int maxValue) {
  Random random = Random();
  return random.nextInt(maxValue);
}

class LocalNotifications {
  static basicNotification(int id) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Simple Notifcation',
            body: 'Notification Body',
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture:
                'https://images.unsplash.com/photo-1677959587685-6b43720d3c5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'));
  }

  static scheduleNotification(int id) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Schedule Notifcation',
            body: 'Schedule Notification Body',
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture:
                'https://images.unsplash.com/photo-1677959587685-6b43720d3c5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
        schedule: NotificationCalendar(
            hour: 21, minute: 41, second: 0, repeats: true));
  }

  static cancelScheduleNotification(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  static Future<void> showNotificationWithActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: 'Anonymous says',
          body: 'Hi there!',
        ),
        actionButtons: [
          NotificationActionButton(
              key: 'SUBSCRIBE',
              label: 'Subscribe',
              autoDismissible: true,
              color: Colors.red),
          NotificationActionButton(
            key: 'DISMISS', label: 'Dismiss', actionType: ActionType.Default,

            autoDismissible: true,
            // enabled: false,
            // color: Colors.greenAccent,
            isDangerousOption: true,
          ),
        ]);
  }

  static Future<void> createMessagingNotification({
    required String channelKey,
    required String groupKey,
    required String chatName,
    required String username,
    required String message,
    String? icon,
  }) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: creatUniqueID(AwesomeNotifications.maxID),
          groupKey: groupKey,
          channelKey: channelKey,
          summary: chatName,
          title: username,
          body: message,
          largeIcon: icon,
          notificationLayout: NotificationLayout.MessagingGroup,
          category: NotificationCategory.Message,
        ),
        actionButtons: [
          NotificationActionButton(
              key: 'REPLY',
              label: 'REPLY',
              autoDismissible: true,
              requireInputText: true,
              color: Colors.blue),
          NotificationActionButton(
            key: 'READ', label: 'Mark as read', actionType: ActionType.Default,

            autoDismissible: true,
            // enabled: false,
            // color: Colors.greenAccent,
            isDangerousOption: true,
          ),
        ]);
  }

// Only Works on Android Platform
  static Future<void> createProgressNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      title: 'Download Fake File...',
      body: 'filename.txt',
      category: NotificationCategory.Progress,
      payload: {
        'file': 'filename.txt',
      },
      notificationLayout: NotificationLayout.ProgressBar,
      progress: null,
      locked: true,
    ));
  }

  static Future<void> createEmojiNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      title: 'Hey 👋👋',
      body: '👋👋',
      category: NotificationCategory.Social,
    ));
  }

  static Future<void> createWakeUpNotification(int id) async {
    await Future.delayed(const Duration(seconds: 5));

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      title: 'Hey 👋👋',
      wakeUpScreen: true,
    ));
  }
}
