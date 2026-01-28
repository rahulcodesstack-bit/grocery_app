import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import '../../../../common/widgets/buttons/primary_button.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({super.key, required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = THelperFunctions.isDarkMode(context);
    final backgroundColor =
        model.bgColor ??
        (isDarkMode
            ? TColors.darkBackgroundPrimary
            : TColors.backgroundPrimary);

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          image: DecorationImage(
            image: AssetImage(model.image),
            fit: BoxFit.cover,
            opacity: isDarkMode ? 0.7 : 1.0,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                SizedBox(height: TSizes.imageCarouselHeight / 5),

                // ================================
                // Title
                // ================================
                Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge?.copyWith(
                    color: isDarkMode
                        ? TColors.darkTextPrimary
                        : TColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // ================================
                // Title logo (Optional)
                // ================================
                if (model.logo != null && model.logo!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
                    child: Image.asset(
                      model.logo!,
                      width: TSizes.productImageSize,
                      height: TSizes.productImageSize / 2.5,
                      fit: BoxFit.contain,
                      // Add color filter for dark mode if needed
                      color: isDarkMode ? Colors.white.withOpacity(0.9) : null,
                      colorBlendMode: isDarkMode ? BlendMode.modulate : null,
                    ),
                  ),

                // ================================
                // Sub Title
                // ================================
                Padding(
                  padding: const EdgeInsets.only(top: TSizes.md),
                  child: Text(
                    model.subTitle,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDarkMode
                          ? TColors.darkTextSecondary
                          : TColors.textSecondary,
                    ),
                  ),
                ),
                const Spacer(),

                // ================================
                // Get started button
                // ================================
                TPrimaryButton(
                  text: TTexts.tSplaceScreenButton,
                  onPressed: model.onButtonPressed,
                  gradient: const LinearGradient(
                    colors: [TColors.primary, TColors.primaryDark],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),

                const SizedBox(height: TSizes.defaultSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
