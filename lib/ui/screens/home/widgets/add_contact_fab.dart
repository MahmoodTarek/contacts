import 'package:contacts/core/theme/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFab extends StatelessWidget {
  final Color backgroundColor;
  final String iconPath;

  final VoidCallback onAddContactClicked;

  const CustomFab({
    super.key,
    required this.iconPath,
    required this.backgroundColor,
    required this.onAddContactClicked,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onAddContactClicked,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
