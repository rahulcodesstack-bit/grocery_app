import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryName;
  final Color categoryColor;

  const ProductsScreen({
    super.key,
    required this.categoryName,
    required this.categoryColor,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // Products data for grid view
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Fresh Peach',
      'price': '\$8.00',
      'unit': 'dozen',
      'image': TImages.product1,
      'isFavorite': false,
      'isNew': true,
      'quantity': 0,
      'color': Color(0xFFFCFFD9),
      'rating': 4.5,
      'reviews': 89,
      'description':
          'Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce section.',
    },
    {
      'name': 'Avocado',
      'price': '\$7.00',
      'unit': '2.0 lbs',
      'image': TImages.product2,
      'isFavorite': false,
      'isNew': true,
      'quantity': 1,
      'color': Color(0xFFFEE1ED),
      'rating': 4.2,
      'reviews': 65,
      'description':
          'Fresh and creamy avocados, perfect for salads, toast, or guacamole.',
    },
    {
      'name': 'Pineapple',
      'price': '\$9.90',
      'unit': '1.50 lbs',
      'image': TImages.product3,
      'isFavorite': true,
      'isNew': false,
      'quantity': 0,
      'discount': '-16%',
      'color': Color(0xFFD2FFD0),
      'rating': 4.8,
      'reviews': 120,
      'description': 'Sweet and juicy pineapples, packed with vitamins.',
    },
    {
      'name': 'Black Grapes',
      'price': '\$7.05',
      'unit': '5.0 lbs',
      'image': TImages.product4,
      'isFavorite': false,
      'isNew': false,
      'quantity': 0,
      'color': Color(0xFFFFCEC1),
      'rating': 4.3,
      'reviews': 75,
      'description': 'Sweet black grapes, seedless and fresh.',
    },
    {
      'name': 'Pomegranate',
      'price': '\$2.09',
      'unit': '1.50 lbs',
      'image': TImages.product5,
      'isFavorite': false,
      'isNew': false,
      'quantity': 0,
      'color': Color(0xFFFFE6C2),
      'rating': 4.6,
      'reviews': 92,
      'description': 'Fresh pomegranates with ruby-red arils.',
    },
    {
      'name': 'Fresh Broccoli',
      'price': '\$3.00',
      'unit': '1 kg',
      'image': TImages.product6,
      'isFavorite': false,
      'isNew': false,
      'quantity': 0,
      'color': Color(0xFFFFE3E2),
      'rating': 4.4,
      'reviews': 58,
      'description': 'Organic fresh broccoli, packed with vitamins.',
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
      backgroundColor: TColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // ==================== APP BAR ====================
            Container(
              height: 75,
              color: TColors.backgroundPrimary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Arrow
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),

                  // Category Name Text
                  Text(
                    widget.categoryName,
                    style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Filter Icon
                  IconButton(
                    icon: const Icon(Icons.tune, color: Colors.black, size: 24),
                    onPressed: () {
                      // Filter action
                    },
                  ),
                ],
              ),
            ),

            // ==================== BODY CONTENT ====================
            Expanded(
              child: Container(
                color: TColors.backgroundSecondary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: TSizes.md,
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.70,
                        ),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return _buildProductCard(product, index);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== PRODUCT CARD WIDGET ====================
  Widget _buildProductCard(Map<String, dynamic> product, int index) {
    return Column(
      children: [
        // Main Card Container
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigate to Product Detail Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: TColors.backgroundPrimary,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                border: Border.all(color: TColors.primary, width: 0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Product Image with Circle Background
                        Expanded(
                          child: Center(
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: product['color'],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  product['image'],
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: TSizes.xs),

                        // Product Details Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product['price'],
                              style: TTextTheme.lightTextTheme.titleMedium
                                  ?.copyWith(color: TColors.primaryDark),
                            ),
                            Text(
                              product['name'],
                              textAlign: TextAlign.center,
                              style: TTextTheme.lightTextTheme.titleMedium
                                  ?.copyWith(color: Colors.black87),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              product['unit'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Favorite Button (Top Right)
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          product['isFavorite'] = !product['isFavorite'];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          product['isFavorite']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product['isFavorite']
                              ? Colors.red
                              : Colors.grey[400],
                          size: 16,
                        ),
                      ),
                    ),
                  ),

                  // NEW Badge (Top Left)
                  if (product['isNew'] && product['discount'] == null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.borderRadiusSm),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          'NEW',
                          style: TextStyle(
                            color: Color(0xFFFF9800),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                  // Discount Badge (Top Left)
                  if (product['discount'] != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEBEE),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.borderRadiusSm),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          product['discount'],
                          style: TextStyle(
                            color: Color(0xFFE53935),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        // Add to Cart Button
        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
            border: Border.all(color: TColors.primary, width: 0.2),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  product['quantity'] = product['quantity'] == 0 ? 1 : 0;
                });
              },
              borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: TColors.primary,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    product['quantity'] == 0 ? 'Add to cart' : 'Remove',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
