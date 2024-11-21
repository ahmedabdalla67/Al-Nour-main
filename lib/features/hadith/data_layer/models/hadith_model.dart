import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';

class HadithModel {
  final String hadith;
  final int number;
  final String url;
  final String? description;
  final bool isDownloaded;

  HadithModel(
      {required this.hadith,
      required this.number,
      required this.url,
      required this.description,
      required this.isDownloaded});

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
        hadith: json['hadith'],
        number: json['number'],
        url: json['url'],
        description: json['description'] ?? '',
        isDownloaded: json['isDownloaded'] ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'hadith': hadith,
      'number': number,
      'url': url,
      'describtion': description ?? '',
      'isDownloaded': isDownloaded,
    };
  }

  HadithEntity toEntity() {
    return HadithEntity(
        url: url,
        isDownloaded: isDownloaded,
        hadith: hadith,
        number: number,
        description: description);
  }
}
