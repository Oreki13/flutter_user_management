import 'package:fpdart/fpdart.dart';

import '../exceptions/https_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  Future<Either<AppException, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
