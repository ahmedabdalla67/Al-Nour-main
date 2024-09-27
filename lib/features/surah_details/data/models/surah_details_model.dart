
class SurahListModel {
  final int number;
  final String name;
  final String arabicName;
  final int versesCount;
  final String? revelationType;  // Additional field not in entity

  SurahListModel({
    required this.number,
    required this.name,
    required this.arabicName,
    required this.versesCount,
    this.revelationType,
  });

  factory SurahListModel.fromJson(Map<String, dynamic> json) {
    return SurahListModel(
      number: json['number'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      arabicName: json['arabic_name'] as String? ?? '',
      versesCount: json['verses_count'] as int? ?? 0,
      revelationType: json['revelation_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'arabic_name': arabicName,
      'verses_count': versesCount,
      'revelation_type': revelationType,
    };
  }
}