import 'package:fpdart/fpdart.dart';
import 'package:user_management/core/exceptions/https_exception.dart';

abstract interface class UseCase<SuccessType, Params>{
  Future<Either<AppException, SuccessType>> call(Params param);
}

class NoParams {}