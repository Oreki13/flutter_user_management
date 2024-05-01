import 'package:flutter/material.dart';
import 'package:user_management/core/theme/app_pallete.dart';
import 'package:user_management/core/theme/text_style.dart';

class TextThemes {
  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppPallete.white),
      bodyMedium: AppTextStyles.body.copyWith(color: AppPallete.white),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppPallete.white),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppPallete.white),
      displayLarge: AppTextStyles.h1.copyWith(color: AppPallete.white),
      displayMedium: AppTextStyles.h2.copyWith(color: AppPallete.white),
      displaySmall: AppTextStyles.h3.copyWith(color: AppPallete.white),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppPallete.white),
    );
  }
}
