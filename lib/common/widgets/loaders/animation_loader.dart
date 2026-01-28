import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';

// ================================
// Animated loader widget (responsive & centered)
// ================================
class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // ================================
    // Responsive animation size
    // ================================
    final double animationSize = screenWidth < 360 ? 100 : screenWidth < 600 ? 130 : 160;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ================================
          // Lottie Animation
          // ================================
          Lottie.asset(
            animation,
            width: animationSize,
            height: animationSize,
            fit: BoxFit.contain,
            repeat: true,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          // ================================
          // Loader Text
          // ================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (showAction) ...[
            const SizedBox(height: TSizes.defaultSpace),
            SizedBox(
              width: 220,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                      ? TColors.darkBackgroundSecondary
                      : TColors.backgroundSecondary,
                ),
                child: Text(
                  actionText ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? TColors.light
                        : TColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
