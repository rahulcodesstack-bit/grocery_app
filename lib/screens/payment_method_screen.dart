import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedPaymentMethod = 1;
  bool _saveCard = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
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
                    'Payment Method',
                    style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: TColors.backgroundSecondary,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Column(
                    children: [
                      _buildProgressIndicator(),
                      const SizedBox(height: TSizes.lg),
                      _buildPaymentMethodSelector(),
                      const SizedBox(height: TSizes.md),
                      _buildCreditCardDisplay(),
                      const SizedBox(height: TSizes.md),
                      _buildCardDetailsForm(),
                      const SizedBox(height: TSizes.md),
                      _buildSaveCardToggle(),
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
                              // Make payment
                            },
                            borderRadius: BorderRadius.circular(
                              TSizes.borderRadiusSm,
                            ),
                            child: Center(
                              child: Text(
                                'Make a payment',
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
            color: TColors.primary,
            margin: const EdgeInsets.only(bottom: 20),
          ),
        ),
        _buildProgressStep(
          number: '2',
          label: 'ADDRESS',
          isCompleted: true,
          isActive: false,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: TColors.primary,
            margin: const EdgeInsets.only(bottom: 20),
          ),
        ),
        _buildProgressStep(
          number: '3',
          label: 'PAYMENT',
          isCompleted: false,
          isActive: true,
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

  Widget _buildPaymentMethodSelector() {
    return Row(
      children: [
        Expanded(
          child: _buildPaymentCard(
            index: 0,
            icon: Icons.paypal,
            label: 'Paypal',
          ),
        ),
        const SizedBox(width: TSizes.sm),
        Expanded(
          child: _buildPaymentCard(
            index: 1,
            icon: Icons.credit_card,
            label: 'Credit Card',
          ),
        ),
        const SizedBox(width: TSizes.sm),
        Expanded(
          child: _buildPaymentCard(
            index: 2,
            icon: Icons.apple,
            label: 'Apple pay',
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCard({
    required int index,
    required IconData icon,
    required String label,
    // String? badge,
  }) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(TSizes.sm),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.grey[700], size: 30),
            const SizedBox(height: 6),
            Text(
              label,
              style: TTextTheme.lightTextTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCardDisplay() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9CCC65), Color(0xFF8BC34A)],
        ),
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -70,
            top: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFAED581).withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: -50,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Color(0xFFAED581).withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(Icons.more_vert, color: Colors.white, size: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5252),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-8, 0),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFA726),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'XXXX  XXXX  XXXX  8750',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 8,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'RUSSELL AUSTIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EXPIRES',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 8,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '01/22',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetailsForm() {
    return Column(
      children: [
        _buildInputField(
          icon: Icons.person_outline,
          hint: 'Name on the card',
          controller: _nameController,
        ),
        const SizedBox(height: TSizes.sm),
        _buildInputField(
          icon: Icons.credit_card_outlined,
          hint: 'Card number',
          controller: _cardNumberController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: TSizes.sm),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                icon: Icons.calendar_today_outlined,
                hint: 'Month / Year',
                controller: _expiryController,
              ),
            ),
            const SizedBox(width: TSizes.sm),
            Expanded(
              child: _buildInputField(
                icon: Icons.lock_outline,
                hint: 'CVV',
                controller: _cvvController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 20),
          const SizedBox(width: TSizes.sm),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: TTextTheme.lightTextTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
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
    );
  }

  Widget _buildSaveCardToggle() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _saveCard = !_saveCard;
            });
          },
          child: Container(
            width: 44,
            height: 24,
            decoration: BoxDecoration(
              color: _saveCard ? TColors.primary : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 200),
              alignment: _saveCard
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(2),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: TSizes.sm),
        Text('Save this card', style: TTextTheme.lightTextTheme.bodyMedium),
      ],
    );
  }
}
