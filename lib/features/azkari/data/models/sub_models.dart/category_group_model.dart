import 'package:mesk/features/azkari/data/models/azkar_model.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';

class CategoryGroupModel{
  final String category;
  final List<AzkarModel> azkarContent;

  CategoryGroupModel({required this.category, required this.azkarContent});

  CategoryGroupEntity toEntity(){
    return CategoryGroupEntity(
      category: category, 
      azkarContent: azkarContent.map((zekr)=>zekr.toEntity()).toList(),
    );
  }
  
}