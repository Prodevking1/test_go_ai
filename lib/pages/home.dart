import 'package:badges/badges.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_ai/core/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_ai/core/cache_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_ai/models/push_notification.dart';
import 'package:overlay_support/overlay_support.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final CacheManager _cacheManager = Get.put(CacheManager());
  // cloud messaging
  late int _notifsCounter = 0;

  PushNotification? _notification;

  @override
  void initState() {
    Firebase.initializeApp();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        PushNotification notification = PushNotification(
          titre: message.notification?.title,
          corps: message.notification?.body,
        );
        setState(() {
          var _notificationDetails = notification;
          _notifsCounter++;
        });
        print(_notification);
        print(_notifsCounter);
        print(notification);
      } else {
        print('no notification');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'accueil'),
        actions: [
          IconButton(
              onPressed: () {
                _authManager.logOut();
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              ' ${_cacheManager.getEmail()}',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text('Attend des notifications',
                style: TextStyle(fontSize: 18.0)),
          ),
          SizedBox(
            height: 30.0,
          ),
          //notification badge
          Badge(
            badgeContent: Text(
              _notifsCounter.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, size: 30.0),
              onPressed: () {
                null;
              },
            ),
          ),
          Row(
            children: [
              Text(
                'Titre',
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              ),
              /* Text(_notification!.titre!), */
            ],
          ),
          Row(
            children: [
              Text('Message',
                  style: TextStyle(color: Colors.green, fontSize: 18)),
              /* Text(_notification!.msg!), */
            ],
          ),
        ],
      ),
    );
  }
}
