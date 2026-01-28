import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/features/authentication/screens/login/login_screen.dart';
import 'package:grocery_app/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';
import 'package:grocery_app/utils/helpers/helper_functions.dart';
import '../../controllers/signup/signup_controller.dart';
import '../widgets/auth_content_container.dart';
import '../widgets/auth_switch_text.dart';
import '../widgets/auth_top_image.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = THelperFunctions.screenHeight();

    Get.put(SignupController());

    return Scaffold(
      extendBodyBehindAppBar: true,

      // ================================
      // App Bar
      // ================================
      appBar: AppBar(
        iconTheme: const IconThemeData(color: TColors.light),
        title: const Text(
          TTexts.authAppBarTitle,
          style: TextStyle(color: TColors.light),
        ),
        centerTitle: true,
      ),

      // ================================
      // Body
      // ================================
      body: Stack(
        children: [
          // ================================
          // Top Image
          // ================================
          AuthTopImage(top: -TSizes.xl, image: TImages.signupImage),

          // ================================
          // Content Container
          // ================================
          AuthContentContainer(
            topPosition: screenHeight * 0.48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.authSignupScreenTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.sm),

                Text(
                  TTexts.authSignupScreenSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: TSizes.md),

                // ================================
                // Signup Form
                // ================================
                const SignupForm(),

                const SizedBox(height: TSizes.spaceBtwInputFields),

                // ================================
                // Switch to Login
                // ================================
                AuthSwitchText(
                  primaryText: TTexts.authSignupScreenAlreadyHaveAccount,
                  actionText: TTexts.authSignupScreenLoginLink,
                  onTap: () => Get.off(() => const LoginScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
