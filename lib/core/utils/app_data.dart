import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:mesk/features/home/data/models/surah_model.dart';

class AppData {

  static final List<SurahModel> _surahs = [];
 // static Map<String, String> _arabicNames = {};
  static bool _isLoaded = false;
  final Random _random = Random();


  static Future<void> loadAllSurahs() async {
    if (_isLoaded) return; // If already loaded, don't reload

    // String arabicNamesJson =
    //     await rootBundle.loadString('assets/arabic_names.json');
    // _arabicNames = Map<String, String>.from(json.decode(arabicNamesJson));
    for (var i = 1; i <= 114; i++) {
      final String fileName = 'surah_$i';
      print(fileName); // For debugging

      try {
        String jsonData =
            await rootBundle.loadString('assets/quran_surahs/$fileName.json');
        Map<String, dynamic> dataMap = json.decode(jsonData);
        print(
            'Loaded surah $i with ${dataMap.length} key-value pairs'); // For debugging

        // Add Arabic Name to dataMap
        // dataMap['arabicName'] = _arabicNames[dataMap['index']];
         _surahs.add(SurahModel.fromJson(dataMap));
      } catch (e) {
        print('Error loading surah $i: $e'); // Error handling
      }
    }
    _isLoaded = true;
  }

    // get all keys of a random surah in this array except on key
    //this method return value of random verse
   String getRandomVerse(Map<String, String> verses) {
    if (verses.isEmpty) return '';
    final verseKeys = verses.keys.where((key)=> key != 'verse_0').toList();
     int randomVerse = _random.nextInt(verseKeys.length);
     return verses.values.elementAt(randomVerse);
  }


  Future<SurahModel> getSurah(int index) async {
    if (_isLoaded) {
      await loadAllSurahs();
    }
    if (index < 1 || index > 114) {
      throw RangeError('Surahs index must be between 1 and 114');
    }
    if (_surahs.isEmpty) {
      throw StateError('Surahs have not been loaded successfully');
    }
    return _surahs[index - 1];
  }

  List<SurahModel> getAllSurahs() {
    if (_surahs.isEmpty) {
      throw StateError('Surahs have not been loaded yet');
    }
    return List.unmodifiable(_surahs);
  }
}



  