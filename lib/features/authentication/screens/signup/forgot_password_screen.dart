import 'package:flutter/material.dart';
import 'package:grocery_app/features/authentication/screens/signup/widgets/auth_header_section.dart';
import 'package:grocery_app/features/authentication/screens/signup/widgets/forgot_password_form.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_text_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================================
      // App Bar
      // ================================
      appBar: AppBar(
        title: const Text(TTexts.forgotPasswordAppBarTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      // ================================
      // Body Section
      // ================================
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: TSizes.defaultSpace * 5),

              // ================================
              // Title & Subtitle Section
              // ================================
              const AuthHeaderSection(
                title: TTexts.forgotPasswordTitle,
                subtitle: TTexts.forgotPasswordSubTitle,
              ),

              const SizedBox(height: TSizes.defaultSpace * 2),

              // ================================
              // Form Section
              // ================================
              const ForgotPasswordForm(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


