import 'package:fpdart/fpdart.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/feature/user_management/domain/entities/city.dart';

abstract interface class CityRepository {
  Future<Either<AppException, List<City>>> getCityList();
}