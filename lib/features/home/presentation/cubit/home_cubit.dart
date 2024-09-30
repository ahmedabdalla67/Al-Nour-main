import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/database/cache/cache_helper.dart';

import 'package:mesk/core/params/home_params.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/features/home/data/models/surah_model.dart';
import 'package:mesk/features/home/domain/entities/home_entity.dart';
import 'package:mesk/features/home/domain/useCases/home_data_use_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int index  = Random().nextInt(114);

  getRandomHomeSurah() async {
    emit(HomeLoading());
    //index = Random().nextInt(114);
    final randomSurah = await getIT<HomeDataUseCase>().call(
      params: RandomVerseParams(
        index: index,
      ),
    );

    randomSurah.fold(
      (surah) async{
        // Get Random Verse Details
        String randomVerseText = getIT<AppData>().getRandomVerse(surah.verse);
        String verseKey = surah.verse.entries.firstWhere((entry)=> entry.value == randomVerseText).key;
        String verseNumber = verseKey.substring(6);

        // Cache the new Data 
        await getIT<CacheHelper>().saveData(key: 'randomSurah', value: json.encode((surah as SurahModel).toJson()));
        await getIT<CacheHelper>().saveData(key: 'randomVerseText', value: randomVerseText);
        await getIT<CacheHelper>().saveData(key: 'verseNumber', value: verseNumber);
        await getIT<CacheHelper>().saveData(key: 'lastGeneratedTime', value: DateTime.now().millisecondsSinceEpoch);

        emit(HomeGetSuccess(randomVerseText: randomVerseText, verseNumber: verseNumber, surah: surah));
      },
      (failure) => emit(HomeGetFailure(errMessage: failure.errorMessage)),
    );
  }

  //method to cache random surah and random verse for 24 hours 
  Future<void> loadOrGenerateRandomVerse() async{
    final lastGeneratedTime = getIT<CacheHelper>().getData(key: 'lastGeneratedTime')?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    //More than 24 hours have passed , generate new verse and surah
    if (currentTime - lastGeneratedTime > 24 * 60 * 60 * 1000) {
      emit(HomeLoading());
      await getRandomHomeSurah();
    }else{
      //Load Cached Data
      final randomSurahJson = getIT<CacheHelper>().getData(key: 'randomSurah');
      final randomVerseText = getIT<CacheHelper>().getData(key: 'randomVerseText');
      final verseNumber = getIT<CacheHelper>().getData(key: 'verseNumber');

      if(randomSurahJson != null && randomVerseText != null && verseNumber != null){
         final randomSurah = SurahModel.fromJson(json.decode(randomSurahJson));
        emit(HomeGetSuccess(randomVerseText: randomVerseText, verseNumber: verseNumber, surah: randomSurah));
      }else{
        await getRandomHomeSurah();
      }
    }

  }
}
