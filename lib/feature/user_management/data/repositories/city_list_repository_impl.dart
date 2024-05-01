import 'package:fpdart/src/either.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/feature/user_management/data/datasources/city_list_data_source.dart';
import 'package:user_management/feature/user_management/domain/entities/city.dart';
import 'package:user_management/feature/user_management/domain/repository/city_repository.dart';

class CityListRepositoryImpl implements CityRepository {
  final CityListDataSource cityListDataSource;

  CityListRepositoryImpl(this.cityListDataSource);

  @override
  Future<Either<AppException, List<City>>> getCityList() async {
    final res = await cityListDataSource.getCityList();
    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
