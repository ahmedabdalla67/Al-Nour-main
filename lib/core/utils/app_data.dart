import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mesk/features/home/data/models/surah_model.dart';

class AppData {
  final List<SurahModel> _surahs = [];

  Future<void> loadAllSurahs() async {
    if (_surahs.isNotEmpty) return;

    //! loop for rename all files and load each file by new name
    for (var i = 1; i < 144; i++) {
      final String fileName = i.toString().padLeft(3, '0');
      String jsonData =
          await rootBundle.loadString('assets/quran_surahs/$fileName.json');

      Map<String, dynamic> dataMap = json.decode(jsonData);
      _surahs.add(SurahModel.fromJson(dataMap));
    }
  }
}
