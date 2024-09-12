import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/home/domain/entities/home_entity.dart';
import 'package:mesk/features/home/presentation/cubit/home_cubit.dart';

class RandomAya extends StatelessWidget {
  const RandomAya({super.key, required this.randomSurah});
  final HomeEntity randomSurah;

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
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            
              String randomVerseText = AppData().getRandomVerse(randomSurah.verse);
              String verseKey = randomSurah.verse.entries.firstWhere((entry) => entry.value == randomVerseText).key;
              String verseNumber = verseKey.substring(6);
              
            return Column(
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
                      'سورة ${randomSurah.arabicName + randomSurah.index.toString()}',
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
                  randomVerseText + verseNumber,
                  textDirection: TextDirection.rtl,
                  style: getApplicationTheme()
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ManageColors.primary),
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
            );
          },
        ),
      ),
    );
  }
}
