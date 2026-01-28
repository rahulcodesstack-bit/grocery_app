import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: TColors.backgroundSecondary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 75,
              color: TColors.backgroundSecondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Order Success',
                    style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: TColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: TColors.primary,
                        size: 60,
                      ),
                    ),
                    const SizedBox(height: TSizes.lg),
                    Text(
                      'Your order was\nsuccessful !',
                      style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.md),
                    Text(
                      'You will get a response within\na few minutes.',
                      style: TTextTheme.lightTextTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      height: TSizes.buttonHeightLg,
                      decoration: BoxDecoration(
                        gradient: TColors.primaryButtonGradient,
                        borderRadius: BorderRadius.circular(
                          TSizes.borderRadiusSm,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Track order action
                          },
                          borderRadius: BorderRadius.circular(
                            TSizes.borderRadiusSm,
                          ),
                          child: Center(
                            child: Text(
                              'Track order',
                              style: TTextTheme.lightTextTheme.bodyLarge
                                  ?.copyWith(
                                    color: TColors.textOnPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.md),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
