import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/features/home/home_screen.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({super.key, required this.phoneNumber});
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _otpControllers[0].text = '1';
    _otpControllers[1].text = '1';
    _otpControllers[2].text = '1';
    _otpControllers[3].text = '1';
    _otpControllers[4].text = '1';
    _otpControllers[5].text = '1';
    _focusNodes[5].requestFocus();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleNext() async {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 6) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    }
  }

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
              height: 85,
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
                    'Verify Number',
                    style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: TSizes.xl),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Verify your number',
                              style: TTextTheme.lightTextTheme.titleLarge
                                  ?.copyWith(fontSize: 25),
                            ),
                            const SizedBox(height: TSizes.sm),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.md,
                              ),
                              child: Text(
                                'Enter your OTP code below',
                                style: TTextTheme.lightTextTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: TSizes.lg * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 45,
                            height: 55,
                            child: TextFormField(
                              controller: _otpControllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: TTextTheme.lightTextTheme.titleLarge,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                counterText: '',
                                filled: true,
                                fillColor: TColors.backgroundPrimary,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm,
                                  ),
                                  borderSide: BorderSide(
                                    color: TColors.primary,
                                    width: 2,
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  _focusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }
                                if (index == 5 && value.isNotEmpty) {
                                  _focusNodes[index].unfocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: TSizes.lg),
                      SizedBox(
                        width: double.infinity,
                        height: TSizes.buttonHeightLg,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: TColors.primaryButtonGradient,
                            borderRadius: BorderRadius.circular(
                              TSizes.borderRadiusMd,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _isLoading ? null : _handleNext,
                              borderRadius: BorderRadius.circular(
                                TSizes.borderRadiusMd,
                              ),
                              child: Center(
                                child: _isLoading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2.5,
                                        ),
                                      )
                                    : Text(
                                        'Next',
                                        style: TTextTheme
                                            .lightTextTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: TColors.textOnPrimary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.md),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Didn\'t receive the code?',
                              style: TTextTheme.lightTextTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Resend a new code',
                                style: TTextTheme.lightTextTheme.bodyMedium
                                    ?.copyWith(
                                      color: TColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
