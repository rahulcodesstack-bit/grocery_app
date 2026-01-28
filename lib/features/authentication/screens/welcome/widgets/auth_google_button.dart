import 'package:flutter/material.dart';
import '../../../../../utils/constants/app_image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class AuthGoogleButton extends StatelessWidget {
  const AuthGoogleButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return SizedBox(
      height: TSizes.buttonHeightLg,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
          splashColor: isDark
              ? TColors.light.withOpacity(0.08)
              : TColors.dark.withOpacity(0.05),
          highlightColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? TColors.dark : TColors.light,
              borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
            ),
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: TSizes.iconLg,
                  width: TSizes.iconLg,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TSizes.xs),
                  ),
                  padding: const EdgeInsets.all(TSizes.xs / 2),
                  child: Image.asset(TImages.googleImage, fit: BoxFit.contain),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
