import 'package:mesk/features/home/data/models/sub_model/juz_model.dart';
import 'package:mesk/features/home/domain/entities/home_entity.dart';

class SurahModel extends HomeEntity {
  

  final int count;
  final List<Juz> juz;

  SurahModel({
    required super.index,
    required this.count,
    required this.juz,
    required super.arabicName,
    required super.verse,
  });

  // لتحويل JSON إلى كائن Dart
  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      index: int.parse(json['index']).toString(),
      arabicName: json['name'],
      verse: Map<String, String>.from(json['verse']),
      count: json['count'],
      juz: List<Juz>.from(json['juz'].map((item) => Juz.fromJson(item))),
    );
  }

  // لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'name': arabicName,
      'verse': verse,
      'count': count,
      'juz': juz.map((item) => item.toJson()).toList(),
    };
  }
}
