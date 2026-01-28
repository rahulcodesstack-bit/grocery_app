import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../../common/widgets/loaders/circular_loader.dart';
import '../constants/app_colors.dart';
import '../helpers/helper_functions.dart';

class TFullScreenLoader {
  // ================================
  // Full screen loading with animation + text
  // ================================
  static void openLoadingDialog(
    String text, {
    String animation = "assets/animations/loading.json",
  }) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.darkBackgroundPrimary
              : TColors.backgroundPrimary,
          body: Center(
            child: TAnimationLoaderWidget(text: text, animation: animation),
          ),
        ),
      ),
    );
  }

  // ================================
  // Small circular loader popup
  // ================================
  static void popUpCircular() {
    Get.dialog(const TCircularLoader(), barrierDismissible: false);
  }

  // ================================
  // Close loader
  // ================================
  static void stopLoading() {
    print("============= stopLoading CALLED =============");
    final context = Get.overlayContext;
    if (context == null) return;
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
