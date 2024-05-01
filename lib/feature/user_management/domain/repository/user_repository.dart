import 'package:fpdart/fpdart.dart';
import 'package:user_management/core/exceptions/https_exception.dart';

import '../entities/user.dart';

abstract interface class UserRepository {
  Future<Either<AppException, User>> addUser({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String city,
  });

  Future<Either<AppException, List<User>>> getUserList();
}
