import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatter,
    this.focusNode,
    this.maxLength,
  });
  final String hint;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).colorScheme.primary,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
