import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class WriteReviewsScreen extends StatefulWidget {
  const WriteReviewsScreen({super.key});

  @override
  State<WriteReviewsScreen> createState() => _WriteReviewsScreenState();
}

class _WriteReviewsScreenState extends State<WriteReviewsScreen> {
  int _selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: TColors.backgroundSecondary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 75,
              color: TColors.backgroundSecondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Write Reviews',
                    style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.lg),
                    Text(
                      'What do you think ?',
                      style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: TSizes.xs),
                    Text(
                      'please give your rating by clicking on\nthe stars below',
                      style: TTextTheme.lightTextTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRating = index + 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              Icons.star,
                              size: 48,
                              color: index < _selectedRating
                                  ? Color(0xFFFFB800)
                                  : Colors.grey[300],
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: TSizes.xl),
                    Container(
                      padding: const EdgeInsets.all(TSizes.sm),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          TSizes.borderRadiusMd,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            color: Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(width: TSizes.sm),
                          Expanded(
                            child: TextField(
                              controller: _reviewController,
                              maxLines: 4,
                              style: TTextTheme.lightTextTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintText: 'Tell us about your experience',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 13,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.xl),
                    Container(
                      width: double.infinity,
                      height: TSizes.buttonHeightLg,
                      decoration: BoxDecoration(
                        gradient: TColors.primaryButtonGradient,
                        borderRadius: BorderRadius.circular(
                          TSizes.borderRadiusSm,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Submit review
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(
                            TSizes.borderRadiusSm,
                          ),
                          child: Center(
                            child: Text(
                              'Start shopping',
                              style: TTextTheme.lightTextTheme.bodyLarge
                                  ?.copyWith(
                                    color: TColors.textOnPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
