import 'dart:ui';

class OnBoardingModel {
  final String image;
  final String title;
  final String? logo;
  final String subTitle;
  final Color? bgColor;
  final VoidCallback onButtonPressed;

  OnBoardingModel({
    required this.image,
    required this.title,
    this.logo,
    required this.subTitle,
    this.bgColor,
    required this.onButtonPressed,
  });
}
