import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/on_boarding/on_boarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key, required this.obController});

  final OnBoardingController obController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() * 2.2,
      left: 0,
      right: 0,
      child: Center(
        child: Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: obController.currentPage.value,
            count: obController.pages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: TColors.primary,
              dotColor: TColors.textSecondary,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 1.1,
              spacing: 8,
            ),
          ),
        ),
      ),
    );
  }
}
