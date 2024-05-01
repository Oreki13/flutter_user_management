import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_management/core/theme/app_pallete.dart';
import 'package:user_management/core/theme/text_theme.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.background,
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.background),
    primaryColor: AppPallete.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppPallete.primary,
      onPrimary: AppPallete.onPrimary,
      secondary: AppPallete.secondary,
      onSecondary: AppPallete.onSecondary,
      error: AppPallete.error,
      background: AppPallete.background,
      surface: AppPallete.white,
    ),
    textTheme: GoogleFonts.montserratTextTheme(TextThemes.darkTextTheme),
  );
}
