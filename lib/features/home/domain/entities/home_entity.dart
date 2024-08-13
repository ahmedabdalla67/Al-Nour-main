import 'package:mesk/features/home/domain/entities/sub_entity/surah_entity.dart';

class HomeEntity{
  final Surah surahName;
  final String pageNumber;
  final Surah randomSurahName;
  final Surah randomAyahName;

  HomeEntity({required this.surahName, required this.pageNumber, required this.randomSurahName, required this.randomAyahName});
}



