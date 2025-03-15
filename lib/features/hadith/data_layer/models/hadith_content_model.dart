import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';

class HadithModel {
  final String hadithText;
  final String? description;
  final int number;
  // final String searchTerm;

  HadithModel({
    required this.hadithText,
    required this.description,
    required this.number,
    // required this.searchTerm
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      hadithText: json['hadith'],
      description: json['description'] ?? '',
      number: json['number'],
      // searchTerm: json['searchTerm']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hadith': hadithText,
      'description': description ?? '',
      'number': number,
      // 'seachTerm': searchTerm,
    };
  }

  HadithEntity toEntity() {
    return HadithEntity(
        description: description ?? '', hadithText: hadithText, number: number);
  }
}
