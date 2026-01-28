import 'package:flutter/material.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.gradient,
    this.isLoading = false,
    this.height,
    this.width,
  });

  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final Gradient? gradient;
  final bool isLoading;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = THelperFunctions.isSmallScreen(context);

    return Container(
      height: height ?? TSizes.buttonHeightLg,
      width: width,
      constraints: BoxConstraints(
        maxWidth: THelperFunctions.screenWidth() * 0.9,
      ),
      decoration: BoxDecoration(
        gradient: gradient ?? TColors.primaryButtonGradient,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
        boxShadow: [
          BoxShadow(
            color: TColors.primary.withOpacity(isSmallScreen ? 0.3 : 0.4),
            blurRadius: isSmallScreen ? 8 : 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
          splashColor: TColors.primaryLight.withOpacity(0.3),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: THelperFunctions.responsiveFontSize(
                context,
                small: TSizes.fontSizeSm,
                medium:TSizes.fontSizeMd,
                large: TSizes.fontSizeLg,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  SizedBox(
                    height: THelperFunctions.responsiveFontSize(
                      context,
                      small: TSizes.fontSizeSm,
                      medium:TSizes.fontSizeMd,
                      large: TSizes.fontSizeLg,
                    ),
                    width: THelperFunctions.responsiveFontSize(
                      context,
                      small: TSizes.fontSizeSm,
                      medium:TSizes.fontSizeMd,
                      large: TSizes.fontSizeLg,
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation(TColors.primaryLight),
                    ),
                  )
                else if (icon != null) ...[
                  Icon(
                    icon,
                    color: TColors.primaryLight,
                    size: TSizes.iconLg,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                ],

                Flexible(
                  child: Text(
                    isLoading ? 'Please wait...' : text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: TColors.primaryLight,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontSize: THelperFunctions.responsiveFontSize(
                        context,
                        small: TSizes.fontSizeSm,
                        medium:TSizes.fontSizeMd,
                        large: TSizes.fontSizeLg,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
