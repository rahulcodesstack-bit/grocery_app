import 'package:flutter/material.dart';

/// App Color Palette (Light + Dark)
class TColors {
  TColors._();

  // ================================
  // LIGHT THEME COLORS
  // ================================
  static const Color primary = Color(0xFFAEDC81);
  static const Color primaryDark = Color(0xFF6CC51D);
  static const Color primaryLight = Color(0xFFEBFFD7);

  static const Color backgroundPrimary = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF4F5F9);
  static const Color backgroundTertiary = Color(0xFFF5F5F5);

  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF868889);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static const Color border = Color(0xFFEBEBEB);
  static const Color link = Color(0xFF1A0DAB);

  // ================================
  // DARK THEME COLORS
  // ================================
  static const Color darkBackgroundPrimary = Color(0xFF121212);
  static const Color darkBackgroundSecondary = Color(0xFF1E1E1E);
  static const Color darkBackgroundTertiary = Color(0xFF2A2A2A);

  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  static const Color darkBorder = Color(0xFF2C2C2C);

  // ================================
  // COMMON / STATUS COLORS
  // ================================
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF121212);

  static const Color yellow = Color(0xFFFFE24B);
  static const Color disabled = Color(0xFFBDBDBD);

  // ================================
  // GRADIENTS
  // ================================
  static const LinearGradient primaryButtonGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // ================================
  // THEME-AWARE GETTERS
  // ================================
  static Color getBackgroundPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackgroundPrimary
        : backgroundPrimary;
  }

  static Color getBackgroundSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackgroundSecondary
        : backgroundSecondary;
  }

  static Color getBackgroundTertiary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackgroundTertiary
        : backgroundTertiary;
  }

  static Color getTextPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextPrimary
        : textPrimary;
  }

  static Color getTextSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextSecondary
        : textSecondary;
  }

  static Color getBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorder
        : border;
  }
}
