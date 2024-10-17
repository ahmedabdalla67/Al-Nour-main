import 'package:flutter/material.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/presentation/widgets/zekr_container_widget.dart';

class ZekrContentListView extends StatelessWidget {
  const ZekrContentListView({super.key, required this.categoryGroup});
  final CategoryGroupEntity categoryGroup;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ZekrContainerWidget(categoryGroup: categoryGroup,index: index,),
      ),
      separatorBuilder:(context, index) => const SizedBox(height: 15,),
      itemCount: 5,
    );
  }
}