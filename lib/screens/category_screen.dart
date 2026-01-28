import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/screens/products_screen.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // Category data
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Vegetables',
      'icon': Icons.eco,
      'color': Color(0xFFE8F5E9),
      'iconColor': Color(0xFF4CAF50),
    },
    {
      'name': 'Fruits',
      'icon': Icons.apple,
      'color': Color(0xFFFFEBEE),
      'iconColor': Color(0xFFE53935),
    },
    {
      'name': 'Beverages',
      'icon': Icons.local_drink,
      'color': Color(0xFFFFF8E1),
      'iconColor': Color(0xFFFFA726),
    },
    {
      'name': 'Grocery',
      'icon': Icons.shopping_basket,
      'color': Color(0xFFF3E5F5),
      'iconColor': Color(0xFF9C27B0),
    },
    {
      'name': 'Edible oil',
      'icon': Icons.opacity,
      'color': Color(0xFFE0F7FA),
      'iconColor': Color(0xFF00BCD4),
    },
    {
      'name': 'Household',
      'icon': Icons.home,
      'color': Color(0xFFFCE4EC),
      'iconColor': Color(0xFFEC407A),
    },
    {
      'name': 'Babycare',
      'icon': Icons.child_care,
      'color': Color(0xFFE3F2FD),
      'iconColor': Color(0xFF2196F3),
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

                  // Category Text
                  Text(
                    'Categories',
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
                  padding: const EdgeInsets.all(TSizes.md),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: TSizes.md,
                          mainAxisSpacing: TSizes.md,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return _CategoryCard(
                        name: category['name'],
                        icon: category['icon'],
                        color: category['color'],
                        iconColor: category['iconColor'],
                        onTap: () {
                          // Navigate to Products Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                categoryName: category['name'],
                                categoryColor: category['iconColor'],
                              ),
                            ),
                          );
                        },
                      );
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
}

// ==================== CATEGORY CARD WIDGET ====================
class _CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.name,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: TColors.backgroundPrimary,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: iconColor, size: 32),
            ),

            const SizedBox(height: TSizes.xs),

            // Category Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                name,
                style: TTextTheme.lightTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
