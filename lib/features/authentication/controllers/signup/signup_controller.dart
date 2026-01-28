import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/features/authentication/models/user_model.dart';
import 'package:grocery_app/features/authentication/screens/signup/verify_number_screen.dart';

import '../../../../data/repository/authentication_repository/authentication_repository.dart';
import '../../../../data/repository/user_repository/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // ================================
  // Form Key
  // ================================
  final signUpFormKey = GlobalKey<FormState>();

  // ================================
  // Text Controllers
  // ================================
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();


  @override
  void onInit() {
    super.onInit();

    // ================================
    // DEV MODE DEFAULT VALUES
    // ================================
    assert(() {
      email.text = 'rm4496097@gmail.com';
      phoneNumber.text = '7879964601';
      password.text = 'Test@123';
      return true;
    }());
  }

  // ================================
  // Repositories
  // ================================
  final AuthenticationRepository _authRepository =
      AuthenticationRepository.instance;
  final UserRepository _userRepository = Get.put(UserRepository());

  // ================================
  // Signup Method
  // ================================
  Future<void> signup() async {
    try {
      // ================================
      // Form Validation
      // ================================
      if (!signUpFormKey.currentState!.validate()) return;

      // ================================
      // Trim Values
      // ================================
      final String userEmail = email.text.trim();
      final String userPassword = password.text.trim();
      final String userPhone = phoneNumber.text.trim();

      // ================================
      // Start Loader
      // ================================
      TFullScreenLoader.openLoadingDialog(
        "We are processing your information...",
      );

      // ================================
      // Internet Check
      // ================================
      final bool isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'No internet connection!');
        return;
      }

      // ================================
      // Firebase Auth Register
      // ================================
      final UserCredential userCredential = await _authRepository.registerUser(
        userEmail,
        userPassword,
      );

      final String uid = userCredential.user!.uid;

      // ================================
      // Create User Model (Initial Data)
      // ================================
      final user = UserModel(
        id: uid,
        email: userEmail,
        phoneNumber: userPhone,
        firstName: '',
        lastName: '',
        profilePicture: '',
        isProfileCompleted: false,
        isPhoneVerified: false,
      );

      // ================================
      // Save User to Firestore
      // ================================
      await _userRepository.saveUserRecord(user);

      // ================================
      // Stop Loader & Redirect
      // ================================
      TLoaders.successSnackBar(
        title: 'Account Created',
        message:
            'Your account has been created successfully. Please verify your Phone Number.',
      );
      TFullScreenLoader.stopLoading();
      Get.off(
        () => VerifyNumberScreen(phoneNumber: userPhone, countryCode: '+91'),
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Signup Failed', message: e.toString());
    }
  }

  // ================================
  // Dispose
  // ================================
  @override
  void onClose() {
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.onClose();
  }
}
