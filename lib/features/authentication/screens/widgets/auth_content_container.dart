import 'package:flutter/material.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class AuthContentContainer extends StatelessWidget {
  const AuthContentContainer({
    super.key,
    required this.topPosition,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  });

  final double topPosition;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final bool isSmallScreen = THelperFunctions.isSmallScreen(context);

    return Positioned(
      top: topPosition,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              (isDark
                  ? TColors.darkBackgroundSecondary
                  : TColors.backgroundSecondary),
          borderRadius:
              borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(
                  isSmallScreen
                      ? TSizes.borderRadiusLg * 1.2
                      : TSizes.borderRadiusLg,
                ),
                topRight: Radius.circular(
                  isSmallScreen
                      ? TSizes.borderRadiusLg * 1.2
                      : TSizes.borderRadiusLg,
                ),
              ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.5)
                  : TColors.textPrimary.withOpacity(0.15),
              blurRadius: isSmallScreen ? 25 : 20,
              spreadRadius: 2,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding:
              padding ??
              EdgeInsets.symmetric(
                horizontal: THelperFunctions.responsivePadding(
                  context,
                  small: TSizes.sm,
                  medium: TSizes.md,
                  large: TSizes.lg,
                ).horizontal,
                vertical: THelperFunctions.screenHeight() * 0.03,
              ),
          child: child,
        ),
      ),
    );
  }
}
