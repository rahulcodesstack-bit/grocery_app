// ================================
// Usage in VerifyEmailScreen
// ================================
import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_strings.dart';
import '../widgets/verification_content.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(TTexts.verifyNumberAppBarTitle),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: VerificationContent(
        title: 'Verify your email',
        subtitle: 'Please enter your email address to receive a verification code',
        inputField: EmailField(controller: emailController),
        buttonText: 'Send Code',
        onButtonPressed: () {
          // Handle send verification code to email
          print('Email: ${emailController.text}');
          // Navigate to OTP screen or show success message
        },
        bottomLink: BottomLink(
          text: 'Resend verification code',
          onTap: () {
            print('Resend verification code');
          },
        ),
      ),
    );
  }
}