import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notifications_system/services/local_notification.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  LocalNotifications.basicNotification(
                      controller.notificationID.value);
                },
                child: const Text(
                  'Basic Notification',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  LocalNotifications.scheduleNotification(
                      controller.notificationID.value);
                },
                child: const Text(
                  'Schedule Notification',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => LocalNotifications.cancelScheduleNotification(
                    controller.notificationID.value),
                child: const Text(
                  'Cancel Schedule Notification',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () =>
                    LocalNotifications.showNotificationWithActionButtons(
                        controller.notificationID.value),
                child: const Text(
                  'Action Notification',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => LocalNotifications.createMessagingNotification(
                    channelKey: 'chats',
                    groupKey: 'Nour_group',
                    chatName: 'Nour Group',
                    message: 'Nour has send a message',
                    username: 'Nour',
                    icon:
                        'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png'),
                child: const Text(
                  'Chat Notification',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
