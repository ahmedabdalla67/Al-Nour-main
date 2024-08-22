import 'package:mesk/core/params/home_params.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/features/home/data/models/surah_model.dart';

//! Standard

class HomeRemoteDataSource {
  final AppData appData;

  HomeRemoteDataSource({required this.appData});
  SurahModel getRandomSurah(RandomVerseParams params) {
    final response = appData.getSurah(params.index) as Map<String, dynamic>;
    return SurahModel.fromJson(response);
  }
}
