import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifications_system/services/notification_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  RxInt notificationID = 10.obs;
  @override
  void onInit() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    NotificationController.initializeLocalNotificationsListeners();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
