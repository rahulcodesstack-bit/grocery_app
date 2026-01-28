import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';

class TPrimaryButton extends StatelessWidget {
  const TPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.width = double.infinity,
    this.height = TSizes.buttonHeightLg,
    this.borderRadius,
    this.gradient,
    this.textStyle,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final radius = borderRadius ?? BorderRadius.circular(TSizes.borderRadiusMd);

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isEnabled
              ? (gradient ?? TColors.primaryButtonGradient)
              : null,
          color: isEnabled
              ? null
              : (isDarkMode ? TColors.darkBackgroundTertiary : TColors.disabled),
          borderRadius: radius,
        ),
        child: ElevatedButton(
          onPressed: isEnabled && !isLoading ? onPressed : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
            foregroundColor: MaterialStateProperty.all(TColors.textOnPrimary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: radius),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: isLoading
              ? const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(TColors.textOnPrimary),
            ),
          )
              : Text(
            text,
            style: textStyle ??
                const TextStyle(
                  color: TColors.textOnPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}