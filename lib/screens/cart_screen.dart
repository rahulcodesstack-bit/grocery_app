import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Fresh Broccoli',
      'price': '\$3.00',
      'unit': '150 lbs',
      'image': TImages.product6,
      'quantity': 5,
      'color': Color(0xFFFFE3E2),
    },
    {
      'name': 'Black Grapes',
      'price': '\$2.22',
      'unit': '5.0 lbs',
      'image': TImages.product4,
      'quantity': 5,
      'color': Color(0xFFFFCEC1),
    },
    {
      'name': 'Avocado',
      'price': '\$2.22',
      'unit': '150 lbs',
      'image': TImages.product2,
      'quantity': 5,
      'color': Color(0xFFFEE1ED),
    },
    {
      'name': 'Pineapple',
      'price': '\$2.22',
      'unit': 'dozen',
      'image': TImages.product3,
      'quantity': 5,
      'color': Color(0xFFD2FFD0),
    },
    {
      'name': 'Fresh Broccoli',
      'price': '\$3.00',
      'unit': '150 lbs',
      'image': TImages.product6,
      'quantity': 5,
      'color': Color(0xFFFFE3E2),
    },
    {
      'name': 'Black Grapes',
      'price': '\$2.22',
      'unit': '5.0 lbs',
      'image': TImages.product4,
      'quantity': 5,
      'color': Color(0xFFFFCEC1),
    },
    {
      'name': 'Avocado',
      'price': '\$2.22',
      'unit': '150 lbs',
      'image': TImages.product2,
      'quantity': 5,
      'color': Color(0xFFFEE1ED),
    },
    {
      'name': 'Pineapple',
      'price': '\$2.22',
      'unit': 'dozen',
      'image': TImages.product3,
      'quantity': 5,
      'color': Color(0xFFD2FFD0),
    },
  ];

  double _getPriceValue(String priceStr) {
    return double.parse(priceStr.replaceAll('\$', ''));
  }

  double get subtotal {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (_getPriceValue(item['price']) * item['quantity']),
    );
  }

  double get shippingCharges => 1.0;
  double get total => subtotal + shippingCharges;

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
                    'Shopping Cart',
                    style: TTextTheme.lightTextTheme.titleLarge,
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: TColors.backgroundSecondary,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(TSizes.md),
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          final item = _cartItems[index];
                          return _buildCartItem(item, index);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(TSizes.md),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              ),
                              Text(
                                '\$${subtotal.toStringAsFixed(1)}',
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.xs),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping charges',
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              ),
                              Text(
                                '\$$shippingCharges',
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TTextTheme.lightTextTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '\$${total.toStringAsFixed(1)}',
                                style: TTextTheme.lightTextTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.sm),
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
                                  // Checkout action
                                },
                                borderRadius: BorderRadius.circular(
                                  TSizes.borderRadiusSm,
                                ),
                                child: Center(
                                  child: Text(
                                    'Checkout',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Dismissible(
      key: Key(item['name']),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: TSizes.sm),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
        ),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      onDismissed: (direction) {
        setState(() {
          _cartItems.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item['name']} removed from cart'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: item['color'],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  item['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: TSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item['price']} x ${item['quantity']}',
                    style: TTextTheme.lightTextTheme.bodyMedium?.copyWith(
                      color: TColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    item['name'],
                    style: TTextTheme.lightTextTheme.bodyLarge?.copyWith(
                      color: TColors.textPrimary,
                    ),
                  ),
                  Text(
                    item['unit'],
                    style: TTextTheme.lightTextTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      item['quantity']++;
                    });
                  },
                  child: Icon(Icons.add, size: 22, color: TColors.primary),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item['quantity']}',
                  style: TTextTheme.lightTextTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (item['quantity'] > 1) {
                        item['quantity']--;
                      }
                    });
                  },
                  child: Icon(Icons.remove, size: 22, color: TColors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
