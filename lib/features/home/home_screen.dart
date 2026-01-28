import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/screens/category_screen.dart';
import 'package:grocery_app/screens/filter_screen.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/screens/products_screen.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_image_strings.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/constants/app_text_strings.dart';
import 'package:grocery_app/utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  int _selectedNavIndex = 0;
  int _currentBannerIndex = 0;

  final List<Map<String, dynamic>> _banners = [
    {'image': TImages.homeBanner, 'title': '20% off on your\nfirst purchase'},
    {'image': TImages.homeBanner, 'title': '30% off on your\nfirst purchase'},
    {'image': TImages.homeBanner, 'title': '40% off on your\nfirst purchase'},
    {'image': TImages.homeBanner, 'title': '50% off on your\nfirst purchase'},
  ];

  final List<Map<String, dynamic>> _categories = [
    {
      'image': TImages.categoryVegetables,
      'label': 'Vegetables',
      'color': Color(0xFF4CAF50),
    },
    {
      'image': TImages.categoryFruits,
      'label': 'Fruits',
      'color': Color(0xFFFF6B6B),
    },
    {
      'image': TImages.categoryBeverages,
      'label': 'Beverages',
      'color': Color(0xFFFFC107),
    },
    {
      'image': TImages.categoryBakery,
      'label': 'Grocery',
      'color': Color(0xFF9C27B0),
    },
    {
      'image': TImages.categoryDairy,
      'label': 'Edible oil',
      'color': Color(0xFF03A9F4),
    },
    {
      'image': TImages.categoryMeat,
      'label': 'Household',
      'color': Color(0xFFE91E63),
    },
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Fresh Peach',
      'price': '\$8.00',
      'unit': 'dozen',
      'image': TImages.product1,
      'image1': TImages.productA,
      'isFavorite': false,
      'isNew': true,
      'quantity': 0,
      'color': Color(0xFFFCFFD9),
      'rating': 4.5,
      'reviews': 89,
      'description':
          'Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce section. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world\'s finest lemon for juicing.',
    },
    {
      'name': 'Avocado',
      'price': '\$7.00',
      'unit': '2.0 lbs',
      'image': TImages.product2,
      'image1': TImages.productA,
      'isFavorite': false,
      'isNew': true,
      'quantity': 1,
      'color': Color(0xFFFEE1ED),
      'rating': 4.2,
      'reviews': 65,
      'description':
          'Fresh and creamy avocados, perfect for salads, toast, or guacamole. Rich in healthy fats and nutrients.',
    },
    {
      'name': 'Pineapple',
      'price': '\$9.90',
      'unit': '1.50 lbs',
      'image': TImages.product3,
      'image1': TImages.productA,
      'isFavorite': true,
      'isNew': false,
      'quantity': 0,
      'discount': '-16%',
      'color': Color(0xFFD2FFD0),
      'rating': 4.8,
      'reviews': 120,
      'description':
          'Sweet and juicy pineapples, packed with vitamins and perfect for fresh consumption or tropical recipes.',
    },
    {
      'name': 'Black Grapes',
      'price': '\$7.05',
      'unit': '5.0 lbs',
      'image': TImages.product4,
      'image1': TImages.productA,
      'isFavorite': false,
      'isNew': false,
      'quantity': 0,
      'color': Color(0xFFFFCEC1),
      'rating': 4.3,
      'reviews': 75,
      'description':
          'Sweet black grapes, seedless and fresh. Perfect for snacking or adding to fruit salads.',
    },
    {
      'name': 'Pomegranate',
      'price': '\$2.09',
      'unit': '1.50 lbs',
      'image': TImages.product5,
      'image1': TImages.productA,
      'isFavorite': false,
      'isNew': false,
      'quantity': 0,
      'color': Color(0xFFFFE6C2),
      'rating': 4.6,
      'reviews': 92,
      'description':
          'Fresh pomegranates with ruby-red arils, rich in antioxidants and perfect for juices and salads.',
    },
    {
      'name': 'Fresh Broccoli',
      'price': '\$3.00',
      'unit': '1 kg',
      'image': TImages.product6,
      'image1': TImages.productA,
      'isFavorite': false,
      'isNew': false,
      'quantity': 0,
      'color': Color(0xFFFFE3E2),
      'rating': 4.4,
      'reviews': 58,
      'description':
          'Organic fresh broccoli, packed with vitamins and minerals. Great for steaming, stir-frying, or salads.',
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
    final screenWidth = THelperFunctions.screenWidth();
    return Scaffold(
      backgroundColor: TColors.backgroundPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Container(
                  height: TSizes.inputFielHeight,
                  decoration: BoxDecoration(
                    color: TColors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(
                      TSizes.inputFieldRadius,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: TTexts.homeScreenSearchPlaceholder,
                      prefixIcon: Icon(
                        Icons.search,
                        color: TColors.textSecondary,
                        size: TSizes.iconMd,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.tune,
                      //   color: TColors.textSecondary,
                      //   size: TSizes.iconMd,
                      // ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          THelperFunctions.navigateToScreen(
                            context,
                            const FilterScreen(),
                          );
                        },
                        child: Icon(
                          Icons.tune,
                          color: TColors.textSecondary,
                          size: TSizes.iconMd,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Container(
                  height: TSizes.imageCarouselHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                    boxShadow: [
                      BoxShadow(
                        color: TColors.textPrimary.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                    child: Column(
                      children: [
                        Expanded(
                          child: CarouselSlider(
                            items: _banners.map((banner) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      banner['image'],
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.black.withOpacity(0.3),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 35,
                                      top: 55,
                                      bottom: 0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            banner['title'],
                                            style: TTextTheme
                                                .lightTextTheme
                                                .titleLarge,
                                          ),
                                          const SizedBox(height: TSizes.md),
                                          Row(
                                            children: _banners
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                                  return Container(
                                                    width:
                                                        _currentBannerIndex ==
                                                            entry.key
                                                        ? 24
                                                        : 8,
                                                    height: 8,
                                                    margin:
                                                        const EdgeInsets.only(
                                                          right: 12,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                      color:
                                                          _currentBannerIndex ==
                                                              entry.key
                                                          ? TColors.primary
                                                          : Colors.white
                                                                .withOpacity(
                                                                  0.8,
                                                                ),
                                                    ),
                                                  );
                                                })
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: TSizes.imageCarouselHeight,
                              viewportFraction: 1.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration: const Duration(
                                milliseconds: 800,
                              ),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: true,
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentBannerIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.md),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TTexts.homeScreenCategoriesTitle,
                      style: TTextTheme.lightTextTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            TTexts.homeScreenSeeAll,
                            style: TTextTheme.lightTextTheme.bodyMedium,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: TColors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.md),
              SizedBox(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _selectedCategoryIndex = index),
                      child: Container(
                        width: 65,
                        margin: const EdgeInsets.only(right: TSizes.sm),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? category['color']
                                    : category['color'].withOpacity(0.15),
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(
                                        color: category['color'],
                                        width: 2,
                                      )
                                    : null,
                              ),
                              child: Center(
                                child: Image.asset(
                                  category['image'],
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                  color: isSelected
                                      ? Colors.white
                                      : category['color'],
                                ),
                              ),
                            ),
                            const SizedBox(height: TSizes.sm),
                            Text(
                              category['label'],
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: isSelected
                                  ? TTextTheme.lightTextTheme.titleMedium
                                  : TTextTheme.lightTextTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: TColors.backgroundSecondary,
                    padding: const EdgeInsets.symmetric(
                      vertical: TSizes.md,
                      horizontal: TSizes.md,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TTexts.homeScreenFeaturedProductsTitle,
                          style: TTextTheme.lightTextTheme.titleLarge,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsScreen(
                                  categoryName: 'Featured Products',
                                  categoryColor: TColors.primary,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                TTexts.homeScreenSeeAll,
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: TColors.textSecondary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: TColors.backgroundSecondary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: TSizes.md,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return _buildProductCard(product, index);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product, int index) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
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
                    color: TColors.textPrimary.withOpacity(0.04),
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
                                  ?.copyWith(color: TColors.textPrimary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              product['unit'],
                              textAlign: TextAlign.center,
                              style: TTextTheme.lightTextTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                        padding: const EdgeInsets.all(TSizes.xs),
                        decoration: BoxDecoration(color: TColors.textOnPrimary),
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
                  if (product['isNew'] && product['discount'] == null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(color: Color(0xFFFFF3E0)),
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
                  if (product['discount'] != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(color: Color(0xFFFFEBEE)),
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
        product['quantity'] == 0
            ? Container(
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
                        product['quantity'] = 1;
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
                          'Add to cart',
                          style: TTextTheme.lightTextTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: 36,
                decoration: BoxDecoration(
                  color: TColors.backgroundPrimary,
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (product['quantity'] > 0) {
                            product['quantity']--;
                          }
                        });
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        child: Icon(
                          Icons.remove,
                          color: TColors.primaryDark,
                          size: 18,
                        ),
                      ),
                    ),
                    Text(
                      '${product['quantity']}',
                      style: TTextTheme.lightTextTheme.titleMedium,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          product['quantity']++;
                        });
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        child: Icon(
                          Icons.add,
                          color: TColors.primaryDark,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home_outlined, Icons.home, 0, "Home"),
              _buildNavItem(Icons.person_outlined, Icons.person, 1, "Account"),
              _buildNavItem(
                Icons.favorite_outlined,
                Icons.favorite,
                2,
                "Favorite",
              ),
              Container(
                width: 60,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.transparent,
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Cart",
                      style: TextStyle(fontSize: 10, color: Colors.transparent),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -25,
            right: 30,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: TColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: TColors.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData outlinedIcon,
    IconData filledIcon,
    int index,
    String label,
  ) {
    final isSelected = _selectedNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected ? TColors.primary : Colors.grey[400],
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? TColors.primary : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
