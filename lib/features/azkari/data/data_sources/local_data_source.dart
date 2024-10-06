import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:mesk/features/azkari/data/models/azkar_model.dart';

class LocalDataSource{


  Future<List<AzkarModel>> getAzkarData() async{
    try {
  final stringData = await rootBundle.loadString('assets/azkar/azkar.json');
  final data = await json.decode(stringData) as List;
  return data.map((jsonData)=> AzkarModel.fromJson(jsonData)).toList();
}  catch (e) {
  log('Error in Lacal Data Source $e');
} 
  throw('Error in get Data');
  }
}