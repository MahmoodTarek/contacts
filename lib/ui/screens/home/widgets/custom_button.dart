import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors_manager.dart';

enum ButtonVariant { primary, secondary }

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final String? iconPath;
  final ButtonVariant variant;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.iconPath,
    this.variant = ButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = variant == ButtonVariant.primary;
    final double contentPaddingValue = isPrimary ? 16 : 12;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isPrimary ? ColorsManager.creamy : ColorsManager.vividRed,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(contentPaddingValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                SvgPicture.asset(iconPath!, width: 10, height: 12.5),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(
                  fontSize: isPrimary ? 20 : 14,
                  fontWeight: FontWeight.w500,
                  color: isPrimary
                      ? ColorsManager.darkBlue
                      : ColorsManager.creamy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
