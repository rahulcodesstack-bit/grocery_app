import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class TChipTheme {
  TChipTheme._();

  // ===============================
  // LIGHT CHIP THEME
  // ===============================
  static final ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: TColors.backgroundSecondary,
    disabledColor: TColors.disabled,
    selectedColor: TColors.primary,

    labelStyle: const TextStyle(
      color: TColors.textPrimary,
      fontWeight: FontWeight.w500,
    ),
    secondaryLabelStyle: const TextStyle(color: TColors.textOnPrimary),

    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

    checkmarkColor: TColors.textOnPrimary,
    brightness: Brightness.light,
  );

  // ===============================
  // DARK CHIP THEME
  // ===============================
  static final ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: TColors.darkBackgroundSecondary,
    disabledColor: TColors.darkBorder,
    selectedColor: TColors.primary,

    labelStyle: const TextStyle(
      color: TColors.darkTextPrimary,
      fontWeight: FontWeight.w500,
    ),
    secondaryLabelStyle: const TextStyle(color: TColors.textOnPrimary),

    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

    checkmarkColor: TColors.textOnPrimary,
    brightness: Brightness.dark,
  );
}
