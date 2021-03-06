import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    IOSInitializationSettings initializationSettingsIOS =
        const IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {}

  onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}

  Future notificationDefaultSound() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Notification Channel ID',
      'Channel Name',
      channelDescription: 'Description',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.show(0, 'New Alert',
        'How to show Local Notification', platformChannelSpecifics,
        payload: 'Default Sound');
  }

  Future notificationNoSound() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Notification Channel ID',
      'Channel Name',
      channelDescription: 'Description',
      playSound: false,
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics =
        const IOSNotificationDetails(presentSound: false);

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.show(0, 'New Alert',
        'How to show Local Notification', platformChannelSpecifics,
        payload: 'No Sound');
  }

  Future<void> notificationCustomSound() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Notification Channel ID',
      'Channel Name',
      channelDescription: 'Description',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics =
        const IOSNotificationDetails(sound: 'slow_spring_board.aiff');

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.show(0, 'New Alert',
        'How to show Local Notification', platformChannelSpecifics,
        payload: 'Custom Sound');
  }

  Future<void> notificationScheduled(int id, String title, String descriprion,
      DateTime dt, var scheduledDate) async {
    var time = Time(dt.hour, dt.minute, 0);

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      channelDescription: 'repeatDailyAtTime description',
      importance: Importance.max,
      priority: Priority.max,
      ledColor: Colors.green,
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        descriprion,
        scheduledDate,
        NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: iOSPlatformChannelSpecifics),
        payload: "Welcome",
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);

    print('ID: ' +
        id.toString() +
        '  Giorno: ' +
        dt.month.toString() +
        "/" +
        dt.day.toString() +
        " alle " +
        time.hour.toString() +
        ":" +
        time.minute.toString());
  }
}
