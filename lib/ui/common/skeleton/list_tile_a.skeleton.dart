import 'package:flutter/material.dart';

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 10, 7),
            height: const Size.fromHeight(kToolbarHeight).height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  isDarkMode ? const Color(0xFF2e302e) : Colors.grey.shade500,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 7),
            height: const Size.fromHeight(kToolbarHeight).height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDarkMode ? const Color(0xFF2e302e) : Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
