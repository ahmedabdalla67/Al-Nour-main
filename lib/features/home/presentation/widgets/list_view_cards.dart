import 'package:flutter/material.dart';
import 'package:mesk/core/card_component.dart';

class ListViewCards extends StatelessWidget {
  const ListViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 15,),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const CardComponent(),
      itemCount: 6,
    );
  }
}