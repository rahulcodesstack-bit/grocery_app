import 'package:grocery_app/features/authentication/screens/on_boarding/on_boarding_screen.dart';

// import 'package:grocery_app/screens/cart_screen.dart';
// import 'package:grocery_app/screens/favorite_screen.dart';
// import 'package:grocery_app/screens/filter_screen.dart';
// import 'package:grocery_app/screens/order_success_screen.dart';
// import 'package:grocery_app/screens/account_screen.dart';
// import 'package:grocery_app/screens/shipping_address_screen.dart';
// import 'package:grocery_app/screens/shipping_method_screen.dart';
// import 'package:grocery_app/screens/write_reviews_screen.dart';
// import 'package:grocery_app/screens/payment_method_screen.dart';
// import 'package:grocery_app/features/home/home_screen.dart';
// import 'package:grocery_app/screens/forgot_password_screen.dart';
// import 'package:grocery_app/screens/verify_number_screen.dart';
import 'package:grocery_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/signup/forgot_password_screen.dart';
import 'features/authentication/screens/signup/verify_email_screen.dart';
import 'features/authentication/screens/signup/verify_number_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Grocery App",
      theme: TAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: CircularProgressIndicator(color: Colors.red,),
        ),
      ),
      // initialBinding: GeneralBindings(),
      // getPages: AppRoutes.pages,
    );
  }
}
