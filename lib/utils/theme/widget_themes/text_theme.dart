import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class TTextTheme {
  TTextTheme._();

  // ===============================
  // LIGHT TEXT THEME
  // ===============================
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TColors.textPrimary,
    ),
    headlineMedium: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: TColors.textPrimary,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: TColors.textPrimary,
    ),

    titleLarge: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: TColors.textPrimary,
    ),
    titleMedium: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.textPrimary,
    ),
    titleSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: TColors.textSecondary,
    ),

    bodyLarge: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.textPrimary,
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.textSecondary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.textSecondary.withOpacity(0.6),
    ),

    labelLarge: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TColors.textPrimary,
    ),
    labelMedium: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.disabled,
    ),
    labelSmall: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.textSecondary,
    ),
  );

  // ===============================
  // DARK TEXT THEME
  // ===============================
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TColors.darkTextPrimary,
    ),
    headlineMedium: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: TColors.darkTextPrimary,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: TColors.darkTextPrimary,
    ),

    titleLarge: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: TColors.darkTextPrimary,
    ),
    titleMedium: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.darkTextPrimary,
    ),
    titleSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: TColors.darkTextSecondary,
    ),

    bodyLarge: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.darkTextPrimary,
    ),
    bodyMedium: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.darkTextSecondary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.darkTextSecondary.withOpacity(0.6),
    ),

    labelLarge: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TColors.darkTextPrimary,
    ),
    labelMedium: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.disabled,
    ),
    labelSmall: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: TColors.textSecondary,
    ),
  );
}
