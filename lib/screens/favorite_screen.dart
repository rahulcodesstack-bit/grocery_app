import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> _favoriteItems = [
    {
      'name': 'Fresh Broccoli',
      'price': '\$3.00',
      'unit': '102 lbs',
      'image': TImages.product6,
      'color': Color(0xFFFFE3E2),
    },
    {
      'name': 'Black Grapes',
      'price': '\$2.22',
      'unit': '50 lbs',
      'image': TImages.product4,
      'color': Color(0xFFFFCEC1),
    },
    {
      'name': 'Avocado',
      'price': '\$2.22',
      'unit': '100 lbs',
      'image': TImages.product2,
      'color': Color(0xFFFEE1ED),
    },
    {
      'name': 'Pineapple',
      'price': '\$2.22',
      'unit': '400 ml',
      'image': TImages.product3,
      'color': Color(0xFFD2FFD0),
    },
    {
      'name': 'Fresh Broccoli',
      'price': '\$3.00',
      'unit': '102 lbs',
      'image': TImages.product6,
      'color': Color(0xFFFFE3E2),
    },
    {
      'name': 'Black Grapes',
      'price': '\$2.22',
      'unit': '50 lbs',
      'image': TImages.product4,
      'color': Color(0xFFFFCEC1),
    },
    {
      'name': 'Avocado',
      'price': '\$2.22',
      'unit': '100 lbs',
      'image': TImages.product2,
      'color': Color(0xFFFEE1ED),
    },
    {
      'name': 'Pineapple',
      'price': '\$2.22',
      'unit': '400 ml',
      'image': TImages.product3,
      'color': Color(0xFFD2FFD0),
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
            // App Bar
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
                    'Favorites',
                    style: TTextTheme.lightTextTheme.titleLarge,
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),

            // Body
            Expanded(
              child: Container(
                color: TColors.backgroundSecondary,
                child: ListView.builder(
                  padding: const EdgeInsets.all(TSizes.md),
                  itemCount: _favoriteItems.length,
                  itemBuilder: (context, index) {
                    final item = _favoriteItems[index];
                    return _buildFavoriteItem(item, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(Map<String, dynamic> item, int index) {
    return Dismissible(
      key: Key('${item['name']}_$index'),
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
          _favoriteItems.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item['name']} removed from favorites'),
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
            // Product Image
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

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['price'],
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
          ],
        ),
      ),
    );
  }
}
