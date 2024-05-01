import 'package:auto_route/auto_route.dart';
import 'package:user_management/feature/user_management/presentation/pages/user_list_page.dart';
import 'package:user_management/feature/user_management/presentation/pages/add_user_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: UserListRoute.page, initial: true),
        AutoRoute(page: AddUserRoute.page)
      ];
}
