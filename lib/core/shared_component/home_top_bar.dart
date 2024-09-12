import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('مرحبا بعودتك',
                style: getApplicationTheme().textTheme.displayLarge
                //TextStyle(fontSize: 30, color: ManageColors.primary),
                ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ManageColors.gray.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        Text(
          '! اكتشف روعة الاسلام معنا',
          style: getApplicationTheme().textTheme.bodySmall,
        ),
      ],
    );
  }
}
