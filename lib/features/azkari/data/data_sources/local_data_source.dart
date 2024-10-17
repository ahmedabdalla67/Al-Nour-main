import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:mesk/features/azkari/data/models/azkar_model.dart';
import 'package:mesk/features/azkari/data/models/sub_models.dart/category_group_model.dart';

class LocalDataSource{


  Future<List<CategoryGroupModel>> getAzkarData() async{
    try {
  final stringData = await rootBundle.loadString('assets/azkar/azkar.json');
  final data = await json.decode(stringData) as List;
  final azkarList = data.map((jsonData)=> AzkarModel.fromJson(jsonData)).toList();

  final Map<String, List<AzkarModel>> groupedData = {};
  for (var zekr in azkarList) {
    if (!groupedData.containsKey(zekr.category)) {
      groupedData[zekr.category] = [];
    }
    groupedData[zekr.category]!.add(zekr);
  }
  // Convert grouped Data to CategoryGroupModel list
  return groupedData.entries.map((entry)=> CategoryGroupModel(category: entry.key, azkarContent: entry.value)).toList();
}  catch (e) {
  log('Error in Lacal Data Source $e');
} 
  throw('Error in get Data');
  }
}