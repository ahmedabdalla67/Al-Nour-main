import 'package:flutter/material.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/presentation/widgets/zekr_content_list_view.dart';

class SearchContentWidget extends StatelessWidget {
  const SearchContentWidget({super.key, required this.categoryGroup});
  final CategoryGroupEntity categoryGroup;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(categoryGroup.category),
      ),
      body: ZekrContentListView(categoryGroup: categoryGroup),
    );
  }
}