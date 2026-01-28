import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/utils/constants/app_colors.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  bool _saveAddress = true;
  String _selectedCountry = 'Select Country';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _zipController.dispose();
    _cityController.dispose();
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
                    'Shipping Address',
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
                    _buildInputField(
                      icon: Icons.person_outline,
                      hint: 'Name',
                      controller: _nameController,
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildInputField(
                      icon: Icons.email_outlined,
                      hint: 'Email address',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildInputField(
                      icon: Icons.phone_outlined,
                      hint: 'Phone number',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildInputField(
                      icon: Icons.location_on_outlined,
                      hint: 'Address',
                      controller: _addressController,
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildInputField(
                      icon: Icons.markunread_mailbox_outlined,
                      hint: 'Zip code',
                      controller: _zipController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildInputField(
                      icon: Icons.location_city_outlined,
                      hint: 'City',
                      controller: _cityController,
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildCountryDropdown(),
                    const SizedBox(height: TSizes.md),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _saveAddress = !_saveAddress;
                            });
                          },
                          child: Container(
                            width: 44,
                            height: 24,
                            decoration: BoxDecoration(
                              color: _saveAddress
                                  ? TColors.primary
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: AnimatedAlign(
                              duration: Duration(milliseconds: 200),
                              alignment: _saveAddress
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
                        Text(
                          'Save this address',
                          style: TTextTheme.lightTextTheme.bodyMedium,
                        ),
                      ],
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

  Widget _buildCountryDropdown() {
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
          Icon(Icons.public, color: Colors.grey[400], size: 20),
          const SizedBox(width: TSizes.sm),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedCountry,
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
                style: TTextTheme.lightTextTheme.bodyMedium,
                hint: Text(
                  'Country',
                  style: TextStyle(color: Colors.grey[400], fontSize: 13),
                ),
                items:
                    [
                      'Select Country',
                      'United States',
                      'India',
                      'United Kingdom',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
