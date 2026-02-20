import 'package:flutter/material.dart';

import '../../../../core/theme/colors_manager.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      endIndent: 16,
      color: ColorsManager.creamy,
    );
  }
}
