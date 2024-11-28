import 'dart:convert';
import 'dart:developer';

import 'package:mesk/features/hadith/data_layer/models/hadith_content_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<HadithModel>> getHadithFiles(String fileName);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final String baseUrl =
      'https://raw.githubusercontent.com/mohamedhashim73/Quran-App-Data/refs/heads/main/Hadith%20Books%20Json/';

  @override
  Future<List<HadithModel>> getHadithFiles(fileName) async {
    try {
      final response = await http.get(Uri.parse(fileName));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        return data.map((json) => HadithModel.fromJson(json)).toList();
      } else {
        throw {'error in get hadith file content'};
      }
    } catch (e) {
      log('Error in Get Hadith File Content: $e');
      return [];
    }
  }

  // @override
  // Future<String> downloadFile(String fileName) async {
  //   try {
  //     final fileUrl = '$baseUrl/$fileName';
  //     final response = await http.get(Uri.parse(fileUrl));

  //     if (response.statusCode == 200) {
  //       return response.body;
  //     } else {
  //       throw {'Error in download file'};
  //     }
  //   } catch (e) {
  //     throw {'Error in Catch in download file'};
  //   }
  // }
}
