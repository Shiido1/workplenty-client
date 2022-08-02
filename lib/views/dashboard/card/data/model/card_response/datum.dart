class Datum {
  int? id;
  String? name;
  String? firstDigits;
  String? lastDigits;
  String? expiryMonth;
  String? expiryYear;
  String? type;
  String? token;
  String? country;
  String? provider;
  String? issuer;
  int? isDefault;

  Datum({
    this.id,
    this.name,
    this.firstDigits,
    this.lastDigits,
    this.expiryMonth,
    this.expiryYear,
    this.type,
    this.token,
    this.country,
    this.provider,
    this.issuer,
    this.isDefault,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        firstDigits: json['first_digits'] as String?,
        lastDigits: json['last_digits'] as String?,
        expiryMonth: json['expiry_month'] as String?,
        expiryYear: json['expiry_year'] as String?,
        type: json['type'] as String?,
        token: json['token'] as String?,
        country: json['country'] as String?,
        provider: json['provider'] as String?,
        issuer: json['issuer'] as String?,
        isDefault: json['is_default'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'first_digits': firstDigits,
        'last_digits': lastDigits,
        'expiry_month': expiryMonth,
        'expiry_year': expiryYear,
        'type': type,
        'token': token,
        'country': country,
        'provider': provider,
        'issuer': issuer,
        'is_default': isDefault,
      };
}
