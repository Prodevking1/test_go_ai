import 'package:get_storage/get_storage.dart';

class CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<bool> saveEmail(String? email) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.EMAIL.toString(), email);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(
      CacheManagerKey.TOKEN.toString(),
    );
  }

  String? getEmail() {
    final box = GetStorage();
    return box.read(
      CacheManagerKey.EMAIL.toString(),
    );
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<void> clear() async {
    final box = GetStorage();
    await box.erase();
  }
}

enum CacheManagerKey { TOKEN, EMAIL }
