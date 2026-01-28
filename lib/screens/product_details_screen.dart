import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  int quantity = 1;
  bool isFavorite = false;
  bool showFullDescription = false;
  bool isTextOverflowing = false;

  @override
  void initState() {
    super.initState();
    quantity = widget.product['quantity'] ?? 1;
    if (quantity < 1) quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: TColors.backgroundPrimary,
      body: Stack(
        children: [
          // PERFECT CIRCLE BG
          Positioned(
            top: -160,
            left: screenWidth / 2 - 245,
            child: Container(
              width: 490,
              height: 490,
              decoration: BoxDecoration(
                color: widget.product['color'],
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // BACK
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, size: 25),
                    ),
                  ),
                ),

                // IMAGE
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    widget.product['image1'],
                    fit: BoxFit.contain,
                  ),
                ),

                // CONTENT
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(TSizes.lg),
                    decoration: const BoxDecoration(
                      color: TColors.backgroundSecondary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(TSizes.borderRadiusSm),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // PRICE + FAVORITE
                          Row(
                            children: [
                              Text(
                                widget.product['price'],
                                style: TTextTheme.lightTextTheme.titleLarge!
                                    .copyWith(color: const Color(0xFF28B446)),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                              ),
                            ],
                          ),

                          Text(
                            widget.product['name'],
                            style: TTextTheme.lightTextTheme.titleLarge,
                          ),
                          Text(
                            widget.product['unit'],
                            style: TTextTheme.lightTextTheme.bodyMedium,
                          ),

                          const SizedBox(height: TSizes.xs),

                          // RATING
                          Row(
                            children: [
                              Text(
                                '4.5',
                                style: TTextTheme.lightTextTheme.titleMedium,
                              ),
                              ...List.generate(
                                5,
                                (_) => const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(width: TSizes.xs),
                              Text(
                                '(89 reviews)',
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              ),
                            ],
                          ),

                          const SizedBox(height: TSizes.sm),

                          // DESCRIPTION + MORE / LESS (OPTIMIZED)
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final textSpan = TextSpan(
                                text:
                                    widget.product['description'] ??
                                    "Organic Mountain works as a seller for many organic growers of organic lemons.",
                                style: TTextTheme.lightTextTheme.bodyMedium,
                              );

                              final textPainter = TextPainter(
                                text: textSpan,
                                maxLines: 3,
                                textDirection: TextDirection.ltr,
                              )..layout(maxWidth: constraints.maxWidth);

                              isTextOverflowing = textPainter.didExceedMaxLines;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedSize(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    child: Text(
                                      widget.product['description'] ??
                                          "Organic Mountain works as a seller for many organic growers of organic lemons.",
                                      maxLines: showFullDescription ? null : 3,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          TTextTheme.lightTextTheme.bodyMedium,
                                    ),
                                  ),

                                  if (isTextOverflowing)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showFullDescription =
                                              !showFullDescription;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                          showFullDescription ? 'less' : 'more',
                                          style: TTextTheme
                                              .lightTextTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: TColors.primaryDark,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),

                          const SizedBox(height: TSizes.sm),

                          // QUANTITY (FULL WIDTH WHITE)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.md,
                              vertical: TSizes.xs,
                            ),
                            decoration: BoxDecoration(
                              color: TColors.backgroundPrimary,
                              borderRadius: BorderRadius.circular(
                                TSizes.borderRadiusSm,
                              ),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Quantity',
                                  style: TTextTheme.lightTextTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: TColors.primaryDark,
                                  ),
                                  onPressed: quantity > 1
                                      ? () => setState(() => quantity--)
                                      : null,
                                ),
                                Text(
                                  '$quantity',
                                  style: TTextTheme.lightTextTheme.titleLarge,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: TColors.primaryDark,
                                  ),
                                  onPressed: () {
                                    setState(() => quantity++);
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: TSizes.sm),

                          // ADD TO CART (GRADIENT)
                          Container(
                            width: double.infinity,
                            height: TSizes.buttonHeightLg,
                            decoration: BoxDecoration(
                              gradient: TColors.primaryButtonGradient,
                              borderRadius: BorderRadius.circular(
                                TSizes.borderRadiusMd,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(
                                  TSizes.borderRadiusSm,
                                ),
                                child: Center(
                                  child: Text(
                                    'Add to cart',
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

                          SizedBox(height: TSizes.defaultSpace),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
