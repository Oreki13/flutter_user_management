import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_management/core/dio/dio_services.dart';
import 'package:user_management/core/dio/network_service.dart';
import 'package:user_management/feature/user_management/data/datasources/user_list_data_source.dart';
import 'package:user_management/feature/user_management/data/repositories/user_list_repository_impl.dart';
import 'package:user_management/feature/user_management/domain/repository/user_repository.dart';
import 'package:user_management/feature/user_management/domain/usecase/add_user.dart';
import 'package:user_management/feature/user_management/domain/usecase/city_list.dart';
import 'package:user_management/feature/user_management/domain/usecase/user_list.dart';
import 'package:user_management/feature/user_management/presentation/bloc/user_bloc/user_bloc.dart';

import 'feature/user_management/data/datasources/city_list_data_source.dart';
import 'feature/user_management/data/repositories/city_list_repository_impl.dart';
import 'feature/user_management/domain/repository/city_repository.dart';
import 'feature/user_management/presentation/bloc/city_bloc/city_bloc.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  final Dio dio = Dio();
  getIt.registerLazySingleton<NetworkService>(() => DioNetworkService(dio));
  _initUser();
  _initCity();
}

void _initUser() {
  getIt
    ..registerFactory<UserListDataSource>(
      () => UserListDataSourceImpl(
        getIt(),
      ),
    )
    ..registerFactory<UserRepository>(
      () => UserListRepositoryImpl(
        getIt(),
      ),
    )
    ..registerFactory(
      () => UserList(
        getIt(),
      ),
    )
    ..registerFactory(
      () => AddUser(getIt()),
    )
    ..registerLazySingleton(
      () => UserBloc(
        userList: getIt(),
        addUser: getIt(),
      ),
    );
}

void _initCity() {
  getIt
    ..registerFactory<CityListDataSource>(
      () => CityListDataSourceImpl(
        getIt(),
      ),
    )
    ..registerFactory<CityRepository>(
      () => CityListRepositoryImpl(
        getIt(),
      ),
    )
    ..registerFactory(
      () => CityList(
        getIt(),
      ),
    )
    ..registerLazySingleton(
      () => CityBloc(
        cityList: getIt(),
      ),
    );
}
