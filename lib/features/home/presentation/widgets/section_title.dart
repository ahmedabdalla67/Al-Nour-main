import 'package:flutter/material.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.onPressed});
final String title;

final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: getApplicationTheme().textTheme.headlineLarge),
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'عرض الكل',
                    style: getApplicationTheme().textTheme.bodyLarge,
                  ),
                ),
              ],
            );
  }
}