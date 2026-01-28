import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/features/authentication/controllers/signup/otp_verification_controller.dart';
import '../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/constants/app_text_strings.dart';

class VerifyNumberForm extends StatefulWidget {
  const VerifyNumberForm({super.key, required controller});

  @override
  State<VerifyNumberForm> createState() => _VerifyNumberFormState();
}

class _VerifyNumberFormState extends State<VerifyNumberForm> {
  late final OtpVerificationController _controller;

  // OTP Controllers
  final List<TextEditingController> _otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  final _phoneController = TextEditingController();
  String _selectedCountryCode = '+91';
  String _selectedFlag = '🇮🇳';

  final List<Map<String, String>> _countryCodes = [
    {'code': '+1', 'flag': '🇺🇸', 'name': 'US'},
    {'code': '+91', 'flag': '🇮🇳', 'name': 'IN'},
    {'code': '+44', 'flag': '🇬🇧', 'name': 'UK'},
    {'code': '+971', 'flag': '🇦🇪', 'name': 'UAE'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = Get.find<OtpVerificationController>();
    _phoneController.text = _controller.phoneNumber;
    _selectedCountryCode = _controller.countryCode;
    _setupOtpListeners();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _setupOtpListeners() {
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.isNotEmpty && i < 5) {
          _focusNodes[i + 1].requestFocus();
        }
        if (_otpControllers[i].text.isEmpty && i > 0) {
          _focusNodes[i - 1].requestFocus();
        }
      });
    }
  }

  String _formatTimer(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _countryCodes.map((country) {
              return ListTile(
                leading: Text(
                  country['flag']!,
                  style: const TextStyle(fontSize: TSizes.iconMd),
                ),
                title: Text(country['code']!),
                subtitle: Text(country['name']!),
                onTap: () {
                  setState(() {
                    _selectedCountryCode = country['code']!;
                    _selectedFlag = country['flag']!;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _handleVerify() {
    String otp = '';
    for (var controller in _otpControllers) {
      otp += controller.text;
    }
    if (otp.length == 6) {
      _controller.verifyOtp(otp);
    } else {
      Get.snackbar(
        'Error',
        'Please enter 6-digit OTP',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _clearOtpFields() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ================================
        // Phone Number Display (Read Only)
        // ================================
        TextFormField(
          controller: _phoneController,
          readOnly: true,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: _showCountryPicker,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_selectedFlag,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: TSizes.sm),
                    Text(
                      _selectedCountryCode,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: TSizes.sm),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            labelText: TTexts.verifyNumberLabelText,
            hintText: TTexts.verifyNumberPlaceholderText,
          ),
        ),
        const SizedBox(height: TSizes.defaultSpace),

        // ================================
        // Next Button
        // ================================
        Obx(() => TPrimaryButton(
          text: TTexts.verifyNumberButtonText,
          onPressed: _controller.isLoading.value ? null : _handleVerify,
          isLoading: _controller.isLoading.value,
          gradient: const LinearGradient(
            colors: [TColors.primary, TColors.primaryDark],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        )),

        const SizedBox(height: TSizes.spaceBtwItems),

        // ================================
        // Timer and Resend Code
        // ================================
        Obx(() => Center(
          child: GestureDetector(
            onTap: _controller.isTimerActive.value
                ? null
                : _controller.resendOtp,
            child: Text(
              _controller.isTimerActive.value
                  ? 'Resend confirmation code ${_formatTimer(_controller.timerSeconds.value)}'
                  : 'Resend OTP',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _controller.isTimerActive.value
                    ? Colors.grey
                    : Colors.blue,
              ),
            ),
          ),
        )),
      ],
    );
  }
}