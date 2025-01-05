class RegisterRequestModel {
  String email;

  RegisterRequestModel(this.email, this.password);

  String password;


  Map<String, dynamic> toJson() {
    return {
      'karim10@gmail.com': email,
      '000000': password,

    };
  }
}
