import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class ShippingMethodScreen extends StatefulWidget {
  const ShippingMethodScreen({super.key});

  @override
  State<ShippingMethodScreen> createState() => _ShippingMethodScreenState();
}

class _ShippingMethodScreenState extends State<ShippingMethodScreen> {
  int _selectedMethod = 0;

  final List<Map<String, dynamic>> _shippingMethods = [
    {
      'title': 'Standard Delivery',
      'description':
          'Order will be delivered between 3 - 4 business days straight to your doorstep.',
      'price': '\$3',
    },
    {
      'title': 'Next Day Delivery',
      'description':
          'Order will be delivered between 3 - 4 business days straight to your doorstep.',
      'price': '\$5',
    },
    {
      'title': 'Nominated Delivery',
      'description':
          'Order will be delivered between 3 - 4 business days straight to your doorstep.',
      'price': '\$3',
    },
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
                    'Shipping Method',
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
                    _buildProgressIndicator(),
                    const SizedBox(height: TSizes.xl),
                    ..._shippingMethods.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: TSizes.md),
                        child: _buildShippingCard(
                          entry.key,
                          entry.value['title'],
                          entry.value['description'],
                          entry.value['price'],
                        ),
                      );
                    }).toList(),
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
                            // Navigate to next step
                          },
                          borderRadius: BorderRadius.circular(
                            TSizes.borderRadiusSm,
                          ),
                          child: Center(
                            child: Text(
                              'Next',
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

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        _buildProgressStep(
          number: '1',
          label: 'DELIVERY',
          isCompleted: true,
          isActive: false,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: Colors.grey[300],
            margin: const EdgeInsets.only(bottom: 20),
          ),
        ),
        _buildProgressStep(
          number: '2',
          label: 'ADDRESS',
          isCompleted: false,
          isActive: false,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: Colors.grey[300],
            margin: const EdgeInsets.only(bottom: 20),
          ),
        ),
        _buildProgressStep(
          number: '3',
          label: 'PAYMENT',
          isCompleted: false,
          isActive: false,
        ),
      ],
    );
  }

  Widget _buildProgressStep({
    required String number,
    required String label,
    required bool isCompleted,
    required bool isActive,
  }) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isCompleted || isActive ? TColors.primary : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    number,
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildShippingCard(
    int index,
    String title,
    String description,
    String price,
  ) {
    final isSelected = _selectedMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
          border: Border.all(
            color: isSelected ? TColors.primary : Colors.transparent,
            width: 2,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TTextTheme.lightTextTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: TSizes.xs),
                  Text(
                    description,
                    style: TTextTheme.lightTextTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: TSizes.sm),
            Text(
              price,
              style: TTextTheme.lightTextTheme.titleMedium?.copyWith(
                color: TColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
