import 'package:flutter/material.dart';
import 'package:grocery_app/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:grocery_app/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:grocery_app/utils/theme/widget_themes/chip_theme.dart';
import '../constants/app_colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  // ===============================
  // LIGHT THEME
  // ===============================
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,

    scaffoldBackgroundColor: TColors.backgroundSecondary,
    primaryColor: TColors.primary,
    disabledColor: TColors.disabled,
    chipTheme: TChipTheme.lightChipTheme,

    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,

    colorScheme: const ColorScheme.light(
      primary: TColors.primary,
      secondary: TColors.primaryDark,
      background: TColors.backgroundPrimary,
      surface: TColors.backgroundSecondary,
      error: TColors.error,
      onPrimary: TColors.textOnPrimary,
      onSecondary: TColors.textPrimary,
      onBackground: TColors.textPrimary,
      onSurface: TColors.textPrimary,
      onError: Colors.white,
    ),
  );

  // ===============================
  // DARK THEME
  // ===============================
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,

    scaffoldBackgroundColor: TColors.darkBackgroundSecondary,
    primaryColor: TColors.primary,
    disabledColor: TColors.disabled,
    chipTheme: TChipTheme.darkChipTheme,

    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,

    colorScheme: const ColorScheme.dark(
      primary: TColors.primary,
      secondary: TColors.primaryDark,
      background: TColors.darkBackgroundPrimary,
      surface: TColors.darkBackgroundSecondary,
      error: TColors.error,
      onPrimary: TColors.textOnPrimary,
      onSecondary: TColors.darkTextPrimary,
      onBackground: TColors.darkTextPrimary,
      onSurface: TColors.darkTextPrimary,
      onError: Colors.white,
    ),
  );
}
