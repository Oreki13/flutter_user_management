import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:user_management/core/theme/theme.dart';
import 'package:user_management/feature/user_management/presentation/bloc/city_bloc/city_bloc.dart';
import 'package:user_management/feature/user_management/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:user_management/routes/app_router.dart';

import 'init_dependencies.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await setUp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => getIt<UserBloc>(),
        ),
        BlocProvider<CityBloc>(
          create: (_) => getIt<CityBloc>(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _route = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        title: "User Management",
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: _route.config(),
      ),
    );
  }
}
