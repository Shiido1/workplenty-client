class User {
  int? id;
  String? avatar;
  String? fname;
  Null mname;
  String? lname;
  String? email;
  String? phone;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.avatar,
      this.fname,
      this.mname,
      this.lname,
      this.email,
      this.phone,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['fname'] = this.fname;
    data['mname'] = this.mname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
