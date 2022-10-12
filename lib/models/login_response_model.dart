class LoginResponseModel {
  String? token;
  String? email;

  LoginResponseModel({this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['name'];
  }
}
