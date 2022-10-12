import 'package:get/get.dart';
import 'package:go_ai/core/cache_manager.dart';
import 'package:go_ai/models/login_request_model.dart';
import 'package:go_ai/models/login_response_model.dart';
import 'package:go_ai/models/register_request_model.dart';
import 'package:go_ai/models/register_response_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class LoginService extends GetConnect {
  final CacheManager _cacheManager = Get.put(CacheManager());

  final String loginUrl =
      'https://3294-2c0f-eb58-20b-4d00-9e42-aba-2239-a25.eu.ngrok.io/api/login';
  final String registerUrl =
      'https://3294-2c0f-eb58-20b-4d00-9e42-aba-2239-a25.eu.ngrok.io/api/register';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final token = _cacheManager.getToken();

    print(token);
    final response = await post(loginUrl, model.toJson(), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
