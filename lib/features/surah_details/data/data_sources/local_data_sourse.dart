import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mesk/features/surah_details/data/models/surah_info_model.dart';

class LocalDataSourse{
  Future<SurahInfoModel> getSurahInfoDataData() async{
    try {
      final jsonData = await rootBundle.loadString('assets/surah_info/surah.json');
      Map<String,dynamic> dataMap = json.decode(jsonData);
      return Future.value(SurahInfoModel.fromJson(dataMap)) ;
    } catch (e) {
      print('Error loading surah $e');
    }
    throw('Erro in Get Surah Info');
  }

}