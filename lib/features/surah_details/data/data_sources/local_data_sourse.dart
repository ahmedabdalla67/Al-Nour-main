import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mesk/features/surah_details/data/models/surah_list_model.dart';

class LocalDataSourse{
  Future<List<SurahListModel>> getSurahInfoDataData() async{
    try {
      final jsonData = await rootBundle.loadString('assets/surah_info/surah.json');
      final data = await json.decode(jsonData) as List;
      return data.map((json)=> SurahListModel.fromJson(json)).toList() ;
    } catch (e) {
      print('Error loading surah $e');
    }
    throw('Erro in Get Surah Info');
  }

}