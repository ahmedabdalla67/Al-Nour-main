import 'package:mesk/features/azkari/domain/Entities/azkar_entity.dart';

class AzkarModel {
  final String category;
  final String? count;
  final String? description;
  final String? reference;
  final String zekr;

  AzkarModel(this.count, this.description, this.reference,
      {required this.category, required this.zekr});

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
        json['count'] ?? '', json['description'] ?? '', json['reference'] ?? '',
        category: json['category'], zekr: json['zekr']);
  }

  AzkarEntity toEntity() {
    return AzkarEntity(zekr: zekr, count: count ?? '', category:category);
  }
}

// Function to Group azkar by a unique category
Map<String, List<AzkarModel>> groupByCategory (List<AzkarModel>azkar){
  Map<String, List<AzkarModel>> groupedData = {};
  for(var key in azkar){
    if(!groupedData.containsKey(key.category)){
      groupedData[key.category] = [];
    }
    groupedData[key.category]!.add(key);
  }
  return groupedData;
}
