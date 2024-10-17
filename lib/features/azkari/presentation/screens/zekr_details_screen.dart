import 'package:flutter/material.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/presentation/widgets/zekr_content_list_view.dart';

class ZekrDetailsScreen extends StatelessWidget {
  const ZekrDetailsScreen({super.key, required this.categoryGroup});
  final CategoryGroupEntity categoryGroup;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      ),
      body: ZekrContentListView(categoryGroup: categoryGroup,),
    );
  }
}