import 'package:education/core/get_x_di.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/presentation/resources/theme_manager.dart';
import 'package:education/presentation/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/local_notification_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CourseAdapter());
  await GetXDi().dependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalNotificationService().init();
  requestPermissions();
  _listenForForegroundFCM();
  _listenForBackgroundFCM();
  _onMessageOpened();
  _getOnMessageOpenedTerminated();

  FirebaseMessaging.instance.getToken().then((token) =>
      debugPrint('Token: ${token.toString()}')
  );
  runApp(const MyApp());
}

void requestPermissions() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User GrantedPermissions');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    debugPrint('User granted Provisional Permissions');
  } else {
    debugPrint('User declined or has not accepted permission');
  }
}

void _listenForForegroundFCM() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Message Foreground: ${message.notification?.title}');
    debugPrint('Message Foreground: ${message.notification?.body}');
    LocalNotificationService().showNotification(
      message.notification?.title ?? '',
      message.notification?.body ?? '',
    );
  });
}

void _listenForBackgroundFCM() async {
  FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    debugPrint('Message Background: ${message.notification?.title}');
    debugPrint('Message Background: ${message.notification?.body}');
  });
}

void _onMessageOpened() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('Message Opened: ${message.notification?.title}');
  });
}

void _getOnMessageOpenedTerminated() async {
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  debugPrint('Message Opened: ${initialMessage?.notification?.title}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      home: const SplashScreen(),
      initialBinding: GetXDi(),
    );
  }
}
