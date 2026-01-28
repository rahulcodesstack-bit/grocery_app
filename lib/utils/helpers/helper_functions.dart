import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  // ===============================
  // CHECK SELECTED THEME COLOR
  // ===============================
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color? getColor(String value) {
    if (value == 'Green') return Colors.green;
    if (value == 'Red') return Colors.red;
    if (value == 'Blue') return Colors.blue;
    if (value == 'Pink') return Colors.pink;
    if (value == 'Grey') return Colors.grey;
    if (value == 'Purple') return Colors.purple;
    if (value == 'Black') return Colors.black;
    if (value == 'White') return Colors.white;
    if (value == 'Yellow') return Colors.yellow;
    if (value == 'Orange') return Colors.deepOrange;
    if (value == 'Brown') return Colors.brown;
    if (value == 'Teal') return Colors.teal;
    if (value == 'Indigo') return Colors.indigo;
    return null;
  }

  static double getTopSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  static double getBottomSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  // static void navigateToScreen(BuildContext context, Widget screen) {
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       pageBuilder: (_, __, ___) => screen,
  //       transitionsBuilder: (_, animation, __, child) {
  //         final slideTween = Tween(
  //           begin: const Offset(1, 0),
  //           end: Offset.zero,
  //         ).chain(CurveTween(curve: Curves.easeInOut));

  //         return SlideTransition(
  //           position: animation.drive(slideTween),
  //           child: FadeTransition(opacity: animation, child: child),
  //         );
  //       },
  //       transitionDuration: const Duration(milliseconds: 350),
  //     ),
  //   );
  // }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double screenHeightPercentage(double percentage) {
    return screenHeight() * percentage;
  }

  static double screenWidthPercentage(double percentage) {
    return screenWidth() * percentage;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String maskPhoneNumber(String number) {
    if (number.length > 6) {
      final visibleStart = number.substring(0, 2);
      final visibleEnd = number.substring(number.length - 3);
      final maskedPart =
          '*' * (number.length - visibleStart.length - visibleEnd.length);
      return '$visibleStart $maskedPart $visibleEnd';
    }
    return number;
  }

  static String generateReferralCode(String firstName) {
    final random = Random();
    final randomNumber = random.nextInt(1000);
    return firstName.toUpperCase() + randomNumber.toString();
  }

  static DateTime? convertToDateTime<T>(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;

    if (value.runtimeType.toString() == 'Timestamp' || (value is T)) {
      try {
        return value.toDate();
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  static String formatDistance(int distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '$distanceInMeters m';
    } else {
      double km = distanceInMeters / 1000;
      return '${km.toStringAsFixed(1)} km';
    }
  }

  static int calculateAge(String formattedDate) {
    try {
      final dateOfBirth = DateFormat('dd-MMM-yyyy').parse(formattedDate);
      final now = DateTime.now();
      int age = now.year - dateOfBirth.year;

      if (now.month < dateOfBirth.month ||
          (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return 0;
    }
  }

  static double responsiveFontSize(
    BuildContext context, {
    double small = 14,
    double medium = 16,
    double large = 18,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return small;
    if (width < 1200) return medium;
    return large;
  }

  static EdgeInsetsGeometry responsivePadding(
    BuildContext context, {
    double small = 16,
    double medium = 32,
    double large = 48,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return EdgeInsets.symmetric(horizontal: small);
    if (width < 1200) return EdgeInsets.symmetric(horizontal: medium);
    return EdgeInsets.symmetric(horizontal: large);
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isMediumScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }
}
