import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/app_colors.dart';
import '../helpers/helper_functions.dart';

class TLoaders {
  // ================================
  //  Hide current snack bar
  // ================================
  static void hideSnackBar() {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  }

  // ================================
  //  Custom toast (centered, theme-aware)
  // ================================
  static void customToast({required String message}) {
    final context = Get.context!;
    final isDark = THelperFunctions.isDarkMode(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isDark
                ? TColors.darkBackgroundSecondary.withOpacity(0.95)
                : TColors.backgroundSecondary.withOpacity(0.95),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: TColors.getTextPrimary(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================================
  //   Success Snack bar
  // ================================
  static void successSnackBar({
    required String title,
    String message = '',
    int duration = 3,
  }) {
    final context = Get.context!;
    final isDark = THelperFunctions.isDarkMode(context);

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(12),
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.light,
      backgroundColor: isDark
          ? TColors.success.withOpacity(0.85)
          : TColors.success,
      icon: const Icon(Iconsax.check, color: TColors.light),
    );
  }

  // ================================
  //  Warning Snack bar
  // ================================
  static void warningSnackBar({required String title, String message = ''}) {
    final context = Get.context!;
    final isDark = THelperFunctions.isDarkMode(context);

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(12),
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.light,
      backgroundColor: isDark
          ? TColors.warning.withOpacity(0.85)
          : TColors.warning,
      icon: const Icon(Iconsax.warning_2, color: TColors.light),
    );
  }

  // ================================
  //  Error Snack bar
  // ================================
  static void errorSnackBar({required String title, String message = ''}) {
    final context = Get.context!;
    final isDark = THelperFunctions.isDarkMode(context);

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(12),
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.light,
      backgroundColor: isDark ? TColors.error.withOpacity(0.9) : TColors.error,
      icon: const Icon(Iconsax.warning_2, color: TColors.light),
    );
  }
}
