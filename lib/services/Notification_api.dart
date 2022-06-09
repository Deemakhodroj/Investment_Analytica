/*import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notificaations = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          'channelId', 'channelName', 'channelDescription',
          importance: Importance.max),
    );
  }

  static Future showNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notificaations.show(id, title, body, await NotificationDetails(),
          payload: payload);
}
*/
