class LoginReqModel {
  String username;
  String password;

  LoginReqModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
