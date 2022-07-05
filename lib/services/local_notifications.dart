import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('assets/icon.png'));

    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage msg) async {
    try {
      final NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
        'agroassist',
        'agroassist channel',
        channelDescription: 'this is our channel',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
      ));
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await _notificationsPlugin.show(id, msg.notification!.title,
          msg.notification!.body, notificationDetails);
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
