import 'package:fpdart/fpdart.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/feature/user_management/data/model/user_model.dart';

import '../../../../core/dio/remote.dart';

abstract class UserListDataSource {
  Future<Either<AppException, List<UserModel>>> getUserList();

  Future<Either<AppException, UserModel>> addUser(
      {required String name,
      required String email,
      required String phoneNumber,
      required String address,
      required String city});
}

class UserListDataSourceImpl extends UserListDataSource {
  final NetworkService networkService;

  UserListDataSourceImpl(this.networkService);

  @override
  Future<Either<AppException, List<UserModel>>> getUserList() async {
    final response = await networkService.get("/api/v1/accurate/user");
    return response.fold(
      (l) => Left(l),
      (r) {
        List<UserModel> data = [];
        data = (r.data as List<dynamic>)
            .map((e) => UserModel.fromJson(e))
            .toList();
        return Right(data);
      },
    );
  }

  @override
  Future<Either<AppException, UserModel>> addUser(
      {required String name,
      required String email,
      required String phoneNumber,
      required String address,
      required String city}) async {
    final response = await networkService.post("/api/v1/accurate/user", data: {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "city": city,
    });
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        UserModel.fromJson(r.data),
      ),
    );
  }
}
