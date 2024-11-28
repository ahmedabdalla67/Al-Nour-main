import 'dart:convert';

import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/errors/exceptions.dart';
import 'package:mesk/features/hadith/data_layer/models/hadith_content_model.dart';

abstract class HadithLocalDataSource {
  Future<List<HadithModel>> getHadiths(String fileName);
  Future<void> cacheHadith(String fileName, String content);
  Future<void> removeHadith(String fileName);
  Future<bool> isHadithDownloaded(String fileName);
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  final CacheHelper cacheHelper;

  HadithLocalDataSourceImpl({required this.cacheHelper});

  @override
  Future<void> cacheHadith(String fileName, String content) async {
    await cacheHelper.saveData(key: fileName, value: content);
  }

  @override
  Future<List<HadithModel>> getHadiths(String fileName) async {
    final jsonString = cacheHelper.getStringData(key: fileName);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => HadithModel.fromJson(json)).toList();
    }
    throw CacheException(errorMessage: 'No cached hadiths found');
  }

  @override
  Future<bool> isHadithDownloaded(String fileName) async {
    return cacheHelper.checkData(key: fileName);
  }

  @override
  Future<void> removeHadith(String fileName) async {
    await cacheHelper.removeData(key: fileName);
  }
}
