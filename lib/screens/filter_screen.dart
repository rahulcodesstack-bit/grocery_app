import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _minPrice = 0;
  double _maxPrice = 100;
  int _selectedRating = 4;
  final List<bool> _otherFilters = [false, true, true];
  final List<String> _otherFilterLabels = [
    'Discount',
    'Free shipping',
    'Same day delivery',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: TColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 75,
              color: TColors.backgroundPrimary,
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
                    'Apply Filters',
                    style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        _minPrice = 0;
                        _maxPrice = 100;
                        _selectedRating = 0;
                        _otherFilters.fillRange(0, _otherFilters.length, false);
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: TColors.backgroundSecondary,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPriceRangeSection(),
                      const SizedBox(height: TSizes.md),
                      _buildStarRatingSection(),
                      const SizedBox(height: TSizes.md),
                      _buildOthersSection(),
                      const SizedBox(height: TSizes.md),
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
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(
                              TSizes.borderRadiusSm,
                            ),
                            child: Center(
                              child: Text(
                                'Apply filter',
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
                      const SizedBox(height: TSizes.md),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRangeSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: TColors.backgroundSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.borderRadiusMd),
                topRight: Radius.circular(TSizes.borderRadiusMd),
              ),
            ),
            child: Text(
              'Price Range',
              style: TTextTheme.lightTextTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Min.',
                            style: TTextTheme.lightTextTheme.bodySmall,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: TColors.backgroundSecondary,
                              borderRadius: BorderRadius.circular(
                                TSizes.borderRadiusSm,
                              ),
                            ),
                            child: Text(
                              '\$${_minPrice.toStringAsFixed(0)}',
                              style: TTextTheme.lightTextTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: TSizes.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max.',
                            style: TTextTheme.lightTextTheme.bodySmall,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: TColors.backgroundSecondary,
                              borderRadius: BorderRadius.circular(
                                TSizes.borderRadiusSm,
                              ),
                            ),
                            child: Text(
                              '\$${_maxPrice.toStringAsFixed(0)}',
                              style: TTextTheme.lightTextTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: TColors.primary,
                    inactiveTrackColor: TColors.backgroundSecondary,
                    thumbColor: TColors.primary,
                    overlayColor: TColors.primary.withOpacity(0.2),
                    trackHeight: 3,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
                  ),
                  child: RangeSlider(
                    values: RangeValues(_minPrice, _maxPrice),
                    min: 0,
                    max: 200,
                    onChanged: (values) {
                      setState(() {
                        _minPrice = values.start;
                        _maxPrice = values.end;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRatingSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: TColors.backgroundSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.borderRadiusMd),
                topRight: Radius.circular(TSizes.borderRadiusMd),
              ),
            ),
            child: Text(
              'Star Rating',
              style: TTextTheme.lightTextTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 24,
                            color: index < _selectedRating
                                ? Color(0xFFFFB800)
                                : Colors.grey[300],
                          );
                        }),
                      ),
                    ),
                    Text(
                      '${_selectedRating} stars',
                      style: TTextTheme.lightTextTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: TColors.primary,
                    inactiveTrackColor: TColors.backgroundSecondary,
                    thumbColor: TColors.primary,
                    overlayColor: TColors.primary.withOpacity(0.2),
                    trackHeight: 3,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
                  ),
                  child: Slider(
                    value: _selectedRating.toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        _selectedRating = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOthersSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: TColors.backgroundSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.borderRadiusMd),
                topRight: Radius.circular(TSizes.borderRadiusMd),
              ),
            ),
            child: Text('Others', style: TTextTheme.lightTextTheme.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: List.generate(_otherFilters.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: TSizes.sm),
                          Text(
                            _otherFilterLabels[index],
                            style: TTextTheme.lightTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _otherFilters[index] = !_otherFilters[index];
                          });
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _otherFilters[index]
                                  ? TColors.primary
                                  : Colors.grey[400]!,
                              width: 2,
                            ),
                            color: _otherFilters[index]
                                ? TColors.primary
                                : Colors.transparent,
                          ),
                          child: _otherFilters[index]
                              ? Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
