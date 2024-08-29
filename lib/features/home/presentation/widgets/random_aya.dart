import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class RandomAya extends StatelessWidget {
  const RandomAya({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(15),
        //height: 170,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: ManageColors.card2.withOpacity(0.28),
          border: const Border.fromBorderSide(
              BorderSide(width: 0.3, color: ManageColors.card2)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'اية اليوم',
                  style: getApplicationTheme()
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ManageColors.primary),
                ),
                Text(
                  'سورة الفاتحة (3)',
                  textDirection: TextDirection.rtl,
                  style: getApplicationTheme()
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ManageColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textDirection: TextDirection.rtl,
              '﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
              style: getApplicationTheme()
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ManageColors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: ManageColors.primary,
                    width: 1.3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'مشاركة',
                    style: getApplicationTheme()
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: ManageColors.primary),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(Icons.share_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
