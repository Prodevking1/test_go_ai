import 'package:go_ai/core/auth_controller.dart';
import 'package:go_ai/pages/home.dart';
import 'package:go_ai/pages/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ?  HomePage() : const AuthPage();
    });
  }
}
