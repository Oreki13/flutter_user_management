import 'package:fpdart/src/either.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/core/usecase/use_case.dart';
import 'package:user_management/feature/user_management/domain/repository/city_repository.dart';

import '../entities/city.dart';

class CityList implements UseCase<List<City>, NoParams> {
  final CityRepository cityRepository;

  CityList(this.cityRepository);

  @override
  Future<Either<AppException, List<City>>> call(NoParams param) async {
    return await cityRepository.getCityList();
  }
}
