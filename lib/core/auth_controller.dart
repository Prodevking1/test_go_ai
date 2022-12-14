import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(
    String? token,
    String? email,
  ) async {
    isLogged.value = true;
    await saveToken(token);
    await saveEmail(email);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
