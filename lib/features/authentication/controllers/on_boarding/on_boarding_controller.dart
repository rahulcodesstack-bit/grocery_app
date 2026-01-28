import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants/app_image_strings.dart';
import '../../../../utils/constants/app_text_strings.dart';
import '../../models/model_on_boarding.dart';
import '../../screens/on_boarding/on_boarding_page_widget.dart';
import '../../screens/welcome/welcome_screen.dart';

class OnBoardingController extends GetxController {
  final userStorage = GetStorage();
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  void animateToNextSlide() {
    if (currentPage.value == pages.length - 1) {
      userStorage.write('isFirstTime', false);
      Get.offAll(() => const WelcomeScreen());
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  late final List<Widget> pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: TImages.onboardingImg1Type1,
        title: TTexts.tSplaceScreenFirstTitle,
        logo: TImages.bigCartLogo,
        subTitle: TTexts.tSplaceScreenFirstSubtitle,
        bgColor: null,
        // null for auto theme detection
        onButtonPressed: animateToNextSlide,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: TImages.onboardingImg2Type1,
        title: TTexts.tSplaceScreenSecondTitle,
        subTitle: TTexts.tSplaceScreenSecondSubtitle,
        bgColor: null,
        onButtonPressed: animateToNextSlide,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: TImages.onboardingImg3Type1,
        title: TTexts.tSplaceScreenThirdTitle,
        subTitle: TTexts.tSplaceScreenThirdSubtitle,
        bgColor: null,
        onButtonPressed: animateToNextSlide,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: TImages.onboardingImg4Type1,
        title: TTexts.tSplaceScreenFourthTitle,
        subTitle: TTexts.tSplaceScreenFourthSubtitle,
        bgColor: null,
        onButtonPressed: animateToNextSlide,
      ),
    ),
  ];
}
