import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/authentication/screens/on_boarding/on_boarding_screen.dart';
import '../../../features/authentication/screens/welcome/welcome_screen.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // ================================
  // Firebase Auth
  // ================================
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ================================
  // Local Storage
  // ================================
  final GetStorage _storage = GetStorage();

  // ================================
  // On Ready
  // ================================
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    _screenRedirect();
    super.onReady();
  }

  // ================================
  // Screen Redirect
  // ================================
  void _screenRedirect() {
    _storage.writeIfNull('isFirstTime', true);

    final bool isFirstTime = _storage.read('isFirstTime');

    if (isFirstTime) {
      Get.offAll(() => const OnBoardingScreen());
    } else {
      Get.offAll(() => const WelcomeScreen());
    }
  }

  // ================================
  // Register User
  // ================================
  Future<UserCredential> registerUser(
      String email,
      String password,
      ) async {
    try {
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code ?? 'platform-error').message;
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }

  }
}
