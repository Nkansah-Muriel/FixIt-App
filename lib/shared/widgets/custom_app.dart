import 'package:fitit_app/core/constants.dart';
// import 'package:fitit_app/core/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      leading: showBackButton
          ? IconButton(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppSizes.iconMd,
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      title: Text(title),
      actions: actions,
    );
  }

  // tells Flutter how tall the AppBar is
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
