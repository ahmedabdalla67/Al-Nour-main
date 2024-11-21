import 'dart:convert';

import 'package:mesk/features/hadith/data_layer/models/hadith_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<HadithModel>> getHadithFiles();
  Future<String> downloadFile(String fileName);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final String baseUrl;

  RemoteDataSourceImpl({required this.baseUrl});

  @override
  Future<String> downloadFile(String fileName) async {
    try {
      final fileUrl = '$baseUrl/$fileName';
      final response = await http.get(Uri.parse(fileUrl));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw {'Error in download file'};
      }
    } catch (e) {
      throw {'Error in Catch in download file'};
    }
  }

  @override
  Future<List<HadithModel>> getHadithFiles() async {
    try {
      final fileUrl = baseUrl;
      final response = await http.get(
        Uri.parse(fileUrl),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => HadithModel.fromJson(json)).toList();
      } else {
        throw {'Error in Get Hadith Files'};
      }
    } catch (e) {
      throw {'Error in Catch in Get Hadith Files'};
    }
  }
}
