// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'created_at': instance.createdAt,
    };
