import 'package:flutter/material.dart';
import 'package:mesk/core/shared_component/home_top_bar.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/home/presentation/widgets/custom_container.dart';
import 'package:mesk/features/home/presentation/widgets/list_view_cards.dart';
import 'package:mesk/features/home/presentation/widgets/random_aya.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            // top Bar
            const HomeTopBar(),

            // date of day
            const SizedBox(
              height: 12,
            ),

            //date and container continue reading
            const CustomContainer(),

            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الااختصارات',
                    style: getApplicationTheme().textTheme.headlineLarge),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'عرض الكل',
                    style: getApplicationTheme().textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 165, child: ListViewCards()),

            const SizedBox(
              height: 20,
            ),
            const RandomAya(),
          ],
        ),
      ),
    );
  }
}
