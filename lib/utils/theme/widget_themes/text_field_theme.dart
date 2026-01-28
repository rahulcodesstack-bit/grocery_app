import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  // ===============================
  // LIGHT INPUT DECORATION THEME
  // ===============================
  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        filled: true,
        fillColor: TColors.backgroundPrimary,

        hintStyle: const TextStyle(color: TColors.textSecondary),
        labelStyle: const TextStyle(color: TColors.textSecondary),
        floatingLabelStyle: const TextStyle(color: TColors.primary),

        prefixIconColor: TColors.textSecondary,
        suffixIconColor: TColors.textSecondary,

        contentPadding: const EdgeInsets.symmetric(
          vertical: TSizes.inputFieldVerticalPadding,
          horizontal: TSizes.inputFieldHorizontalPadding,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(color: TColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(color: TColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 2, color: TColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(color: TColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 2, color: TColors.error),
        ),
      );

  // ===============================
  // DARK INPUT DECORATION THEME
  // ===============================
  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        filled: true,
        fillColor: TColors.darkBackgroundSecondary,

        hintStyle: const TextStyle(color: TColors.darkTextSecondary),
        labelStyle: const TextStyle(color: TColors.darkTextSecondary),
        floatingLabelStyle: const TextStyle(color: TColors.primary),

        prefixIconColor: TColors.darkTextSecondary,
        suffixIconColor: TColors.darkTextSecondary,

        contentPadding: const EdgeInsets.symmetric(
          vertical: TSizes.inputFieldVerticalPadding,
          horizontal: TSizes.inputFieldHorizontalPadding,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(color: TColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(color: TColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 2, color: TColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(color: TColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 2, color: TColors.error),
        ),
      );
}
