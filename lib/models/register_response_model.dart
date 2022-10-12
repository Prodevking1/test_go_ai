class RegisterResponseModel {
  String? token;
  String? email;

  RegisterResponseModel({this.token, this.email});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['user']['email'];
  }
}
