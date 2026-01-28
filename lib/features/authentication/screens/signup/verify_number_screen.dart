import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grocery_app/features/authentication/screens/signup/widgets/auth_header_section.dart';
import 'package:grocery_app/features/authentication/screens/signup/widgets/verify_number_form.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_text_strings.dart';
import '../../controllers/signup/otp_verification_controller.dart';

class VerifyNumberScreen extends StatelessWidget {
  final String phoneNumber;
  final String countryCode;

  const VerifyNumberScreen({
    super.key,
    required this.phoneNumber,
    this.countryCode = '+91',
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OtpVerificationController(phoneNumber: phoneNumber));
    return Scaffold(
      // ================================
      // App Bar
      // ================================
      appBar: AppBar(
        title: const Text(TTexts.verifyNumberAppBarTitle),
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
                title: TTexts.verifyNumberTitle,
                subtitle: TTexts.verifyNumberSubTitle,
              ),
              const SizedBox(height: TSizes.defaultSpace * 2),

              // ================================
              // Form Section (Using existing VerifyNumberForm)
              // ================================

              GetBuilder<OtpVerificationController>(
                builder: (controller) =>
                    VerifyNumberForm(controller: controller),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
