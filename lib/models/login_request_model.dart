class LoginRequestModel {
  String? email;
  String? password;
  String? token;

  LoginRequestModel({this.email, this.password, this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    /* data['token'] = token; */

    return data;
  }
}
