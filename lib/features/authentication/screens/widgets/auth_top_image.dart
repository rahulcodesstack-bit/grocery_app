import 'package:flutter/material.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/constants/app_sizes.dart';

class AuthTopImage extends StatelessWidget {
  const AuthTopImage({
    super.key,
    required this.image,
    this.heightFactor = 0.7,
    this.top,
    this.left = 0,
    this.right = 0,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.opacity = 1.0,
    this.overlayColor,
  });

  final String image;
  final double heightFactor;
  final double? top;
  final double? left;
  final double? right;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final double opacity;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final screenHeight = THelperFunctions.screenHeight();
    final isSmallScreen = THelperFunctions.isSmallScreen(context);

    return Positioned(
      top: top ?? (isSmallScreen ? -TSizes.xs * 2 : -TSizes.xs),
      left: left,
      right: right,
      child: Opacity(
        opacity: opacity,
        child: Container(
          height:
              screenHeight *
              (isSmallScreen ? heightFactor * 0.9 : heightFactor),
          width: width ?? THelperFunctions.screenWidth(),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: AssetImage(image),
              fit: fit,
              colorFilter: ColorFilter.mode(
                overlayColor ??
                    (isDark
                        ? Colors.black.withOpacity(0.2)
                        : Colors.black.withOpacity(0.1)),
                BlendMode.darken,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
