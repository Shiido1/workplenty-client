import 'user.dart';

class Datum {
  int? id;
  User? user;
  String? message;
  dynamic file;
  String? batchNo;
  String? createdAt;

  Datum({
    this.id,
    this.user,
    this.message,
    this.file,
    this.batchNo,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        message: json['message'] as String?,
        file: json['file'] as dynamic,
        batchNo: json['batch_no'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'message': message,
        'file': file,
        'batch_no': batchNo,
        'created_at': createdAt,
      };
}
