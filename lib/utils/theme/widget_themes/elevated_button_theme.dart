import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  // ===============================
  // LIGHT ELEVATED BUTTON THEME
  // ===============================
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // backgroundColor: TColors.primaryDark,
          // foregroundColor: TColors.textOnPrimary,

          disabledBackgroundColor: TColors.backgroundTertiary,
          disabledForegroundColor: TColors.textSecondary,

          padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
      );

  // ===============================
  // DARK ELEVATED BUTTON THEME
  // ===============================
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // backgroundColor: TColors.primary,
          // foregroundColor: TColors.textOnPrimary,

          disabledBackgroundColor: TColors.darkBackgroundTertiary,
          disabledForegroundColor: TColors.darkTextSecondary,

          padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
      );
}
