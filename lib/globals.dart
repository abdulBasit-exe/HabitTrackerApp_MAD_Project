// global.dart

library simple_habits.globals;

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Color themeColor = Colors.pink; // global Color for theme accent

// Function to launch mail app at directed email
Future<void> launchURL() async {
  const url = 'mailto:work.roynulrohan@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Set color into SharedPreferences
Future<void> setColor(int value, String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('colorValue', value);
  prefs.setString('color', name);
}

// String to Color
Color toColor(String value) {
  switch (value) {
    case 'Pink':
      return Colors.pink;
    case 'Green':
      return Colors.green;
    case 'Blue':
      return Colors.blue;
    default:
      return Colors.black.withOpacity(0.75);
  }
}

// Function to convert int to Day of local_notifications library
Day toDay(int i) {
  const days = [
    Day.Sunday,
    Day.Monday,
    Day.Tuesday,
    Day.Wednesday,
    Day.Thursday,
    Day.Friday,
    Day.Saturday,
  ];
  return days[i];
}

// Function to correct DateTime.weekday to Day
int dayCorrector(int i) {
  const days = [1, 2, 3, 4, 5, 6, 0];
  return days[i];
}

// Function to schedule notification
Future<void> scheduleNotification(int channel, Day day, String time, String title) async {
  var timeOfDay = TimeOfDay.fromDateTime(DateFormat.jm().parse(time));
  var scheduledNotificationDateTime = Time(timeOfDay.hour, timeOfDay.minute, 0);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'reminders',
    'Reminders',
    'Habit reminder notifications',
    icon: 'notification_icon',
    largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    autoCancel: true,
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics,
    iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    channel,
    'Habit Reminder for "$title"',
    'Tap to open app',
    day,
    scheduledNotificationDateTime,
    platformChannelSpecifics,
  );
}

// Function to cancel notification by channel
Future<void> cancelNotification(int channel) async {
  await flutterLocalNotificationsPlugin.cancel(channel);
}

// Function to cancel all notifications
Future<void> cancelAllNotifications() async {
  await flutterLocalNotificationsPlugin.cancelAll();
}
