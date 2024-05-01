import 'package:user_management/feature/user_management/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.city,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      city: map['city'] ?? "",
      address: map['address'] ?? "",
    );
  }
}
