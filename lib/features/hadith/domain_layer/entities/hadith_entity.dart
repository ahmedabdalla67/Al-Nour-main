import 'package:mesk/features/hadith/data_layer/models/hadith_content_model.dart';

class HadithEntity {
  final String hadithText;
  final int number;
  final String? description;

  HadithEntity({
    required this.description,
    required this.hadithText,
    required this.number,
  });

  HadithModel toModel() {
    return HadithModel(
      hadithText: hadithText,
      description: description,
      number: number,
    );
  }
}
