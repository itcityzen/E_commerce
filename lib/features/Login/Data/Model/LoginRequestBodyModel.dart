class LoginRequestBodyModel {
  String username;
  String password;
  int ExpireInMins;

  LoginRequestBodyModel(this.username, this.password, {this.ExpireInMins = 60});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "expiresInMins": ExpireInMins
    };
  }
}
