// lib/utils/widgets/custom_appbar.dart
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/app_sizes.dart';
import 'package:grocery_app/utils/theme/widget_themes/text_theme.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.leadingIcon,
    this.leadingOnPressed,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
    this.elevation,
  });

  final Widget? title;
  final bool showBackButton;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                leadingIcon ?? Icons.arrow_back_ios,
                size: TSizes.iconSm,
              ),
              onPressed: leadingOnPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// With title text only (simplified version)
class TAppBarWithTitle extends StatelessWidget implements PreferredSizeWidget {
  const TAppBarWithTitle({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Text(title, style: TTextTheme.lightTextTheme.titleLarge),
      showBackButton: showBackButton,
      leadingOnPressed: onBackPressed,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
