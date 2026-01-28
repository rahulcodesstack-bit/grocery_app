import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/features/authentication/screens/login/login_screen.dart';
import 'package:grocery_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:grocery_app/features/authentication/screens/welcome/widgets/auth_google_button.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';
import 'package:grocery_app/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/app_colors.dart';
import '../widgets/auth_content_container.dart';
import '../widgets/auth_primary_button.dart';
import '../widgets/auth_switch_text.dart';
import '../widgets/auth_top_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = THelperFunctions.screenHeight();

    return Scaffold(
      extendBodyBehindAppBar: true,
      // ================================
      // App Bar Section
      // ================================
      appBar: AppBar(
        title: const Text(
          TTexts.authAppBarTitle,
          style: TextStyle(color: TColors.light),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      // ================================
      // Body Section
      // ================================
      body: Stack(
        children: [
          // ================================
          // Top Image
          // ================================
          AuthTopImage(image: TImages.welcomeImage),

          // ================================
          // Content
          // ================================
          AuthContentContainer(
            topPosition: screenHeight * 0.56,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.authWelcomeScreenTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.sm),

                Text(
                  TTexts.authWelcomeScreenSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: TSizes.md),

                /// ================================
                /// Google Login Button
                /// ================================
                AuthGoogleButton(
                  text: TTexts.authWelcomeScreenLoginWithGoogle,
                  onTap: () {
                    // TODO: Google Sign-In logic
                  },
                ),
                const SizedBox(height: TSizes.sm),


                /// ================================
                /// Primary Action Button
                /// ================================
                AuthPrimaryButton(
                  text: TTexts.authWelcomeScreenCreateNewAccount,
                  icon: Icons.person_outline,
                  onTap: () => Get.to(() => const SignupScreen()),
                ),
                const SizedBox(height: TSizes.md),


                /// ================================
                /// Already have an account
                /// ================================
                AuthSwitchText(
                  primaryText: TTexts.authWelcomeScreenAlreadyHaveAccount,
                  actionText: TTexts.authWelcomeScreenLogin,
                  onTap: () => Get.to(() => const LoginScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
