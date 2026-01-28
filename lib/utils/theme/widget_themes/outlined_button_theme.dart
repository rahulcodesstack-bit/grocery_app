import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  // ===============================
  // LIGHT OUTLINED BUTTON THEME
  // ===============================
  static final OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: TColors.primary,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: TColors.border, width: 1),
          padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
      );

  // ===============================
  // DARK OUTLINED BUTTON THEME
  // ===============================
  static final OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: TColors.primary,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: TColors.darkBorder, width: 1),
          padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
      );
}
