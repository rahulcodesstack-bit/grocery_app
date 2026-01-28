import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static final AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,

    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),

    iconTheme: const IconThemeData(
      color: TColors.textPrimary,
      size: TSizes.iconMd,
    ),
    actionsIconTheme: const IconThemeData(
      color: TColors.textPrimary,
      size: TSizes.iconMd,
    ),

    titleTextStyle: TTextTheme.lightTextTheme.headlineSmall,
  );

  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,

    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),

    iconTheme: const IconThemeData(
      color: TColors.darkTextPrimary,
      size: TSizes.iconMd,
    ),
    actionsIconTheme: const IconThemeData(
      color: TColors.darkTextPrimary,
      size: TSizes.iconMd,
    ),

    titleTextStyle: TTextTheme.darkTextTheme.headlineSmall,
  );
}
