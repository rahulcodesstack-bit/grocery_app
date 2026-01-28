import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';
import '../../widgets/auth_primary_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _obscurePassword = true;

  final controller = SignupController.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          // ================================
          // Email Field
          // ================================
          TextFormField(
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: TTexts.authSignupScreenEmailPlaceholder,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: TValidator.validateEmail,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // ================================
          // Phone Number Field
          // ================================
          TextFormField(
            controller: controller.phoneNumber,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: TTexts.authSignupScreenPhonePlaceholder,
              prefixIcon: Icon(Icons.phone_outlined),
            ),
            validator: TValidator.validatePhoneNumber,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // ================================
          // Password Field
          // ================================
          TextFormField(
            controller: controller.password,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: TTexts.authSignupScreenPasswordPlaceholder,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: TValidator.validatePassword,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // ================================
          // Create Account Button
          // ================================
          AuthPrimaryButton(
            text: TTexts.authSignupScreenSignupButton,
            onTap: () {
              if (controller.signUpFormKey.currentState!.validate()) {
                controller.signup();
              }
            },
          ),
        ],
      ),
    );
  }
}
