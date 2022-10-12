import 'package:go_ai/core/auth_controller.dart';
import 'package:go_ai/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Launcher extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Launcher({super.key});

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoarding();
          }
        }
      },
    );
  }

  /* 
    Widgets used
  */

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
        body: Center(child: Text('Erreur rencontree: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('En cours de chargement...'),
        ],
      ),
    ));
  }
}
