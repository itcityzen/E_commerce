class RegisterRequestModel {
  String email;

  RegisterRequestModel(this.email, this.password);

  String password;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
