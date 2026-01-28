import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/data/repository/authentication_repository/authentication_repository.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // ================================
  // Flutter Binding & Native Splash
  // ================================
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ================================
  // Storage Initialization
  // ================================
 await GetStorage.init();

  // ================================
  // Firebase Initialization
  // ================================
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository());
  });

  // ================================
  // Run Application
  // ================================
  runApp(const App());
}
