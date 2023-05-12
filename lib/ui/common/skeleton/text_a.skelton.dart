import 'package:flutter/material.dart';

class TextASkeleton extends StatelessWidget {
  const TextASkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Container(
      height: 20,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDarkMode ? const Color(0xFF2e302e) : Colors.grey.shade500,
      ),
    );
  }
}
