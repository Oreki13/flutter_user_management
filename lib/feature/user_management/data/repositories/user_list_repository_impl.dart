import 'package:fpdart/src/either.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/feature/user_management/data/datasources/user_list_data_source.dart';
import 'package:user_management/feature/user_management/domain/entities/user.dart';
import 'package:user_management/feature/user_management/domain/repository/user_repository.dart';

class UserListRepositoryImpl implements UserRepository {
  final UserListDataSource userListDataSource;

  UserListRepositoryImpl(this.userListDataSource);

  @override
  Future<Either<AppException, List<User>>> getUserList() async {
    final res = await userListDataSource.getUserList();
    return res.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<AppException, User>> addUser(
      {required String name,
      required String email,
      required String phoneNumber,
      required String address,
      required String city}) async {
    final res = await userListDataSource.addUser(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      city: city,
    );
    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
