class RegisterRequestModel {
  String? name;
  String? email;
  String? password;

  RegisterRequestModel({this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = email;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
