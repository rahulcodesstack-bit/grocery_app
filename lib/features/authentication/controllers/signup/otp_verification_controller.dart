import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/data/repository/user_repository/user_repository.dart';
import 'package:grocery_app/utils/popups/full_screen_loader.dart';
import 'package:grocery_app/utils/popups/loaders.dart';

import '../../../home/home_screen.dart';

class OtpVerificationController extends GetxController {
  // ================================
  // DEVELOPMENT MODE - FREE NO SMS
  // ================================
  static const bool isDevelopmentMode = true;
  static const String developmentOtp = '123456';

  final String phoneNumber;
  final String countryCode;

  // ================================
  // Rx Variables
  // ================================
  RxInt timerSeconds = 120.obs;
  RxBool isLoading = false.obs;
  RxBool isTimerActive = true.obs;
  RxBool isOtpVerified = false.obs;

  OtpVerificationController({
    required this.phoneNumber,
    this.countryCode = '+91',
  }) {}

  // ================================
  // Initialize OTP Verification
  // ================================
  Future<void> _initializeOtpVerification() async {
    if (isDevelopmentMode) {
      await _sendDevelopmentOtp();
    } else {
      await _sendProductionOtp();
    }
  }

  // ================================
  // Development OTP (NO SMS - FREE)
  // ================================
  Future<void> _sendDevelopmentOtp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    TLoaders.successSnackBar(
      title: '📱 OTP Sent (Development Mode)',
      message: 'Use OTP: $developmentOtp\nPhone: $countryCode$phoneNumber',
    );
    print('DEVELOPMENT MODE ACTIVATED');
    print('Phone: $countryCode$phoneNumber');
    print('OTP: $developmentOtp');
    print('Tip: Enter $developmentOtp to verify');
  }

  // ================================
  // Production OTP (Real SMS)
  // ================================
  Future<void> _sendProductionOtp() async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '$countryCode$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          await _onVerificationSuccess();
        },
        verificationFailed: (FirebaseAuthException e) {
          TLoaders.errorSnackBar(
            title: 'Verification Failed',
            message: e.message ?? 'Unknown error',
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          isLoading.value = false;
          TLoaders.successSnackBar(
            title: 'OTP Sent',
            message: 'OTP has been sent to your phone',
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 120),
      );
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Error', message: 'Failed to send OTP');
    }
  }

  // ================================
  // Verify OTP Method
  // ================================
  Future<void> verifyOtp(String otp) async {
    try {
      if (otp.length != 6) {
        TLoaders.warningSnackBar(
          title: 'Invalid OTP',
          message: 'Please enter 6-digit OTP',
        );
        return;
      }
      TFullScreenLoader.openLoadingDialog(
        isDevelopmentMode
            ? 'Verifying OTP (Development)...'
            : 'Verifying OTP...',
      );
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      if (isDevelopmentMode) {
        await _verifyDevelopmentOtp(otp);
      } else {
        await _verifyProductionOtp(otp);
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // ================================
  // Verify Development OTP
  // ================================
  Future<void> _verifyDevelopmentOtp(String otp) async {
    if (otp == developmentOtp) {
      print('DEVELOPMENT: OTP verified successfully');
      await _updateUserVerificationStatus();
      await _onVerificationSuccess();
    } else {
      TFullScreenLoader.stopLoading();
      isLoading.value = false;
      TLoaders.errorSnackBar(
        title: 'Invalid OTP',
        message: 'In development mode, use OTP: $developmentOtp',
      );
    }
  }

  // ================================
  // Verify Production OTP
  // ================================
  Future<void> _verifyProductionOtp(String otp) async {
    try {
      await _updateUserVerificationStatus();
      await _onVerificationSuccess();
    } catch (e) {
      rethrow;
    }
  }

  // ================================
  // Update User Verification Status
  // ================================
  Future<void> _updateUserVerificationStatus() async {
    try {
      final userRepository = Get.find<UserRepository>();
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await userRepository.updatePhoneVerification(currentUser.uid, true);
      }
    } catch (e) {
      print('Note: User verification updated in development');
      // In development, we don't worry about this error
    }
  }

  // ================================
  // On Verification Success
  // ================================
  Future<void> _onVerificationSuccess() async {
    TFullScreenLoader.stopLoading();
    isLoading.value = false;
    isOtpVerified.value = true;

    TLoaders.successSnackBar(
      title: isDevelopmentMode ? 'Success (Development)' : 'Success',
      message: 'Phone number verified successfully!',
    );
    Get.back(result: true);
    Get.offAll(() => const HomeScreen());
  }

  // ================================
  // Resend OTP Method
  // ================================
  Future<void> resendOtp() async {
    try {
      if (isTimerActive.value) return;
      isLoading.value = true;
      if (isDevelopmentMode) {
        // Development resend
        await Future.delayed(const Duration(seconds: 1));
        isLoading.value = false;
        _resetTimer();
        TLoaders.successSnackBar(
          title: 'OTP Resent (Development)',
          message: 'Use OTP: $developmentOtp',
        );
      } else {
        // Production resend
        // Implement real resend logic here
      }
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // ================================
  // Timer Methods
  // ================================
  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
        _startTimer();
      } else {
        isTimerActive.value = false;
      }
    });
  }

  void _resetTimer() {
    timerSeconds.value = 120;
    isTimerActive.value = true;
    _startTimer();
  }
}
