// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddUserPage(),
      );
    },
    UserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserListPage(),
      );
    },
  };
}

/// generated route for
/// [AddUserPage]
class AddUserRoute extends PageRouteInfo<void> {
  const AddUserRoute({List<PageRouteInfo>? children})
      : super(
          AddUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserListPage]
class UserListRoute extends PageRouteInfo<void> {
  const UserListRoute({List<PageRouteInfo>? children})
      : super(
          UserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
