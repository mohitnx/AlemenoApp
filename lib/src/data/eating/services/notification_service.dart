import 'package:alemenotest/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

sendNotificaton() async {
  AndroidNotificationDetails androidDetails = const AndroidNotificationDetails(
    'channelId',
    'ikj',
    enableVibration: true,
    playSound: true,
  );
  NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(
      1, 'Thank you for sharing food with me', '', notificationDetails);
}
