import 'package:go_ai/core/auth_controller.dart';
import 'package:go_ai/models/login_request_model.dart';
import 'package:go_ai/models/register_request_model.dart';
import 'package:go_ai/pages/auth.dart';
import 'package:go_ai/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../pages/home.dart';

class LoginRepository extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response != null) {
      Get.defaultDialog(
          title: 'Success',
          middleText: 'Vous etes connecté avec succès',
          textConfirm: 'OK',
          onConfirm: () {
            Get.to(() => HomePage());
          });
    } else {
      Get.defaultDialog(
          middleText: 'Utilisateur non existant',
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
    final response = await _loginService.fetchRegister(
        RegisterRequestModel(name: email, email: email, password: password));

    if (response != null) {
      print(response.email);
      _authManager.login(response.token, response.email);
      Get.defaultDialog(
          title: 'Success',
          middleText: 'Vous etes connecté avec succès',
          textConfirm: 'OK',
          onConfirm: () {
            Get.to(() => AuthPage());
          });
    } else {
      Get.defaultDialog(
          middleText: "Inscription echouee",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
