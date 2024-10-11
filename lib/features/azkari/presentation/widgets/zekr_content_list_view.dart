import 'package:flutter/material.dart';
import 'package:mesk/features/azkari/presentation/widgets/zekr_container_widget.dart';

class ZekrContentListView extends StatelessWidget {
  const ZekrContentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: ZekrContainerWidget(),
      ),
      separatorBuilder:(context, index) => const SizedBox(height: 15,),
      itemCount: 5,
    );
  }
}