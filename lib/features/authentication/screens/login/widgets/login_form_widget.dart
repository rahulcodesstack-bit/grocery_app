import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';

import '../../widgets/auth_primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================================
        // Email
        // ================================
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: TTexts.authLoginScreenEmailPlaceholder,
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        // ================================
        // Password
        // ================================
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
            hintText: TTexts.authLoginScreenPasswordPlaceholder,
            prefixIcon: Icon(Icons.lock_outline),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        // ================================
        // Login Button
        // ================================
        AuthPrimaryButton(
          text: TTexts.authLoginScreenLoginButton,
          onTap: onLogin,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
      ],
    );
  }
}
