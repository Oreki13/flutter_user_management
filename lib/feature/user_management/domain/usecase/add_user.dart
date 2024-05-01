import 'package:fpdart/src/either.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/core/usecase/use_case.dart';
import 'package:user_management/feature/user_management/domain/entities/user.dart';
import 'package:user_management/feature/user_management/domain/repository/user_repository.dart';

class AddUser implements UseCase<User, User> {
  final UserRepository userRepository;

  AddUser(this.userRepository);

  @override
  Future<Either<AppException, User>> call(User params) async {
    return await userRepository.addUser(
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      address: params.address,
      city: params.city,
    );
  }
}
