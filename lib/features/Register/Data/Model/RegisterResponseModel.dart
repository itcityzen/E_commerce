class RegisterResponseModel {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? email;
  String? phone;
  String? username;
  String? password;

  RegisterResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.email,
    this.phone,
    this.username,
    this.password,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }
}
