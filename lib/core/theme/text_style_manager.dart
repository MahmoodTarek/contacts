
import 'package:contacts/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

abstract final class TextStyleManager {
  static final TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorsManager.creamy
  );
}