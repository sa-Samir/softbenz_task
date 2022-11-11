import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _notificationService = FlutterLocalNotificationsPlugin();

  Future initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);

    await _notificationService.initialize(settings);
  }

  void sendNotifications(id, title, body, notificationDetails) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    _notificationService.show(id, title, body, notificationDetails);
  }
}
