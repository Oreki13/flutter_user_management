import 'package:fpdart/fpdart.dart';
import 'package:user_management/core/exceptions/https_exception.dart';
import 'package:user_management/core/usecase/use_case.dart';
import 'package:user_management/feature/user_management/domain/entities/user.dart';
import 'package:user_management/feature/user_management/domain/repository/user_repository.dart';

class UserList implements UseCase<List<User>, NoParams> {
  final UserRepository userRepository;

  UserList(this.userRepository);

  @override
  Future<Either<AppException, List<User>>> call(NoParams params) async {
    return await userRepository.getUserList();
  }
}
