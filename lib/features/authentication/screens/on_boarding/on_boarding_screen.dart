import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/features/authentication/screens/on_boarding/widget/on_boarding_dot_navigation.dart';
import '../../controllers/on_boarding/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: obController.pageController,
            onPageChanged: (index) {
              obController.currentPage.value = index;
            },
            itemCount: obController.pages.length,
            itemBuilder: (context, index) {
              return obController.pages[index];
            },
          ),
          OnBoardingDotNavigation(obController: obController),
        ],
      ),
    );
  }
}
