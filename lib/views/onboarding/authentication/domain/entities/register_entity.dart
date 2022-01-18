class RegisterEntity {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? role;

  RegisterEntity(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.role});

  RegisterEntity.fromJson(Map<String, dynamic> json) {
    if (json["fname"] is String) firstName = json["fname"];
    if (json["lname"] is String) lastName = json["lname"];
    if (json["email"] is String) email = json["email"];
    if (json["password"] is String) password = json["password"];
    if (json["phone"] is String) phone = json["phone"];
    if (json["role"] is String) phone = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
    data["fname"] = firstName;
    data["lname"] = lastName;
    data["email"] = email;
    data["password"] = password;
    data["phone"] = phone;
    data["role"] = role;
    return data;
  }
}