import 'dart:convert';

import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/errors/exceptions.dart';
import 'package:mesk/features/home/data/models/surah_model.dart';

class HomeLocalDataSource {
  final CacheHelper cache;
  final String key = 'CachedHome';

  HomeLocalDataSource({required this.cache});

  cacheHome(SurahModel? surahToCache) {
    if (surahToCache != null) {
      print('sourah t;o cache $surahToCache');
      cache.saveData(
        key: 'key',
        // value cannot stored as a model so i will convert model to json and from json i will encode to String and store it
        //and when i call method to show data i will convert again to model
        value: json.encode(surahToCache.toJson()),
      );
    } else {
      throw CacheException(
          errorMessage:
              'NO Internet Connection'); //علي الافتراض ان البيانات جاية من الانترنت Api
    }
  }

  Future<SurahModel> getLastHomeData() {
    final jsonData = cache.getStringData(key: key);
    print('jsonData-----------> $jsonData');
    if (jsonData != null) {
      return Future.value(SurahModel.fromJson(json.decode(jsonData)));
    } else {
      print('cach exception-----------');
      throw CacheException(errorMessage: 'NO Internet Connection');
    }
  }
}
