import 'package:get_storage/get_storage.dart';

class Users {
  final box = GetStorage();

  Future<bool> saveUser(String? email, String? password) async {
    await box.write('users', {
      'email': email,
      'password': password,
    });
    return true;
  }

  Future<bool> checkUser(String? email, String password) async {
    List users = await box.read('users');
    var response;
    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        return response = true;
      } else {
        response = false;
      }
    }
    return response;
  }
}
