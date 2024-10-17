import 'package:mesk/features/azkari/domain/Entities/azkar_entity.dart';

class CategoryGroupEntity{
  final String category;
  final List<AzkarEntity> azkarContent;

  CategoryGroupEntity({required this.category, required this.azkarContent});
}