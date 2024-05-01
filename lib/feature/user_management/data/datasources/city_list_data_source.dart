import 'package:fpdart/fpdart.dart';
import 'package:user_management/core/dio/network_service.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/feature/user_management/data/model/city_model.dart';

abstract class CityListDataSource {
  Future<Either<AppException, List<CityModel>>> getCityList();
}

class CityListDataSourceImpl extends CityListDataSource {
  final NetworkService networkService;

  CityListDataSourceImpl(this.networkService);

  @override
  Future<Either<AppException, List<CityModel>>> getCityList() async {
    final response = await networkService.get("/api/v1/accurate/city");
    return response.fold(
      (l) => Left(l),
      (r) {
        List<CityModel> data = [];
        data = (r.data as List<dynamic>)
            .map((e) => CityModel.fromJson(e))
            .toList();
        return Right(data);
      },
    );
  }
}
