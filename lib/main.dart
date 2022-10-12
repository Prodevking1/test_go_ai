import 'package:firebase_core/firebase_core.dart';
import 'package:go_ai/pages/auth.dart';
import 'package:go_ai/pages/launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
        title: 'Go-AI demo app',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: Launcher(),
      ),
    );
  }
}
