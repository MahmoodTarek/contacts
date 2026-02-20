import 'package:contacts/core/theme/colors_manager.dart';
import 'package:contacts/core/theme/text_style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final bool hasError;
  final Function(String) onSubmit;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.onSubmit,
    this.hasError = false,
    this.inputType = TextInputType.name,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      cursorHeight: 20,
      style: TextStyleManager.medium,
      keyboardType: widget.inputType,
      onChanged: widget.onSubmit,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: widget.hasError
                ? ColorsManager.vividRed
                : ColorsManager.creamy,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: widget.hasError
                ? ColorsManager.vividRed
                : ColorsManager.creamy,
          ),
        ),

        hintText: widget.hint,
        hintStyle: TextStyleManager.medium.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
