import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:grocery_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';
import 'package:grocery_app/utils/helpers/helper_functions.dart';
import '../widgets/auth_content_container.dart';
import '../widgets/auth_switch_text.dart';
import '../widgets/auth_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = THelperFunctions.screenHeight();

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
        automaticallyImplyLeading: true,
      ),

      // ================================
      // Body Section
      // ================================
      body: Stack(
        children: [
          // ================================
          // Top Image
          // ================================
          AuthTopImage(image: TImages.signingInImage),

          // ================================
          // Content
          // ================================
          AuthContentContainer(
            topPosition: screenHeight * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.authLoginScreenTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.sm),


                Text(
                  TTexts.authLoginScreenSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: TSizes.md),

                // ================================
                // Login Form
                // ================================
                LoginForm(
                  onLogin: () {
                    // TODO: Login Logic
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),


                /// ================================
                /// Create new account link
                /// ================================
                AuthSwitchText(
                  primaryText: TTexts.authLoginScreenNoAccount,
                  actionText: TTexts.authLoginScreenSignUpLink,
                  onTap: () => Get.to(() => const SignupScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
