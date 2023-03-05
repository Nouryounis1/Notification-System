import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

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
}
