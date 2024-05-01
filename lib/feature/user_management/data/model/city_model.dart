import 'package:user_management/feature/user_management/domain/entities/city.dart';

class CityModel extends City {
  CityModel({required super.id, required super.name});

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
    );
  }
}
