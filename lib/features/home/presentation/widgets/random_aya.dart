
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/font_manager.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/home/presentation/cubit/home_cubit.dart';
import 'package:quran/quran.dart';

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
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if(state is HomeGetFailure){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMessage)),
                );
              }
          },
          builder: (context, state) {
              
              if (state is HomeInitial){
                context.read<HomeCubit>().loadOrGenerateRandomVerse();
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is HomeGetSuccess){
               return( Column(
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
                      // 'سورة ${state.surah.arabicName}',
                      'سورة ${getSurahNameArabic(state.surah.index)} (${state.surah.index})',
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
                  '${state.randomVerseText} (${state.verseNumber})',
                  textDirection: TextDirection.rtl,
                  style: getApplicationTheme()
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ManageColors.black.withOpacity(0.8), fontFamily: FontConstants.quranFontFamily, fontSize: FontSize.s20),
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
            )
               );
                
              }else{
                return Text('An error occured');
              }
            
          },
        ),
      ),
    );
  }
}
