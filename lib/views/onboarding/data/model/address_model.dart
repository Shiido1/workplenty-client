class AddressModel {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  AddressModel({this.msg, this.data, this.success, this.code});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json["msg"] is String) this.msg = json["msg"];
    if (json["data"] is Map)
      this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
    if (json["success"] is bool) this.success = json["success"];
    if (json["code"] is int) this.code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["msg"] = this.msg;
    if (this.data != null) data["data"] = this.data?.toJson();
    data["success"] = this.success;
    data["code"] = this.code;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? apartmentNo;
  String? address;
  String? country;
  String? state;
  String? zipCode;
  String? city;
  String? cityId;
  int? stateId;
  int? countryId;
  String? phone;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.apartmentNo,
      this.address,
      this.zipCode,
      this.country,
      this.state,
      this.city,
      this.cityId,
      this.stateId,
      this.countryId,
      this.phone,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["apartment_no"] is String) this.apartmentNo = json["apartment_no"];
    if (json["address"] is String) this.address = json["address"];
    if (json["country"] is String) this.address = json["country"];
    if (json["state"] is String) this.address = json["state"];
    if (json["zip_code"] is String) this.zipCode = json["zip_code"];
    if (json["city"] is String) this.city = json["city"];
    if (json["city_id"] is String) this.cityId = json["city_id"];
    if (json["state_id"] is int) this.stateId = json["state_id"];
    if (json["country_id"] is int) this.countryId = json["country_id"];
    if (json["phone"] is String) this.phone = json["phone"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["apartment_no"] = this.apartmentNo;
    data["address"] = this.address;
    data["country"] = this.address;
    data["state"] = this.address;
    data["zip_code"] = this.zipCode;
    data["city"] = this.city;
    data["city_id"] = this.cityId;
    data["state_id"] = this.stateId;
    data["country_id"] = this.countryId;
    data["phone"] = this.phone;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
