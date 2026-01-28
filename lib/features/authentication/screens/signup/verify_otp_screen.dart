import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_strings.dart';
import '../widgets/verification_content.dart';

class OtpScreenScreen extends StatelessWidget {
  const OtpScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpControllers = List.generate(6, (index) => TextEditingController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(TTexts.verifyOtpAppBarTitle),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: VerificationContent(
        title: TTexts.verifyOtpTitle,
        subtitle: TTexts.verifyOtpSubTitle,
        inputField: OTPField(controllers: otpControllers),
        buttonText: TTexts.verifyOtpButtonText,
        onButtonPressed: () {
          final otp = otpControllers.map((c) => c.text).join();
          print('OTP: $otp');
        },
        bottomLink: BottomLink(
          text: 'Didn\'t receive the code ?\nResend a new code',
          onTap: () {
            // Handle resend code
            print('Resend OTP');
          },
        ),
      ),
    );
  }
}
