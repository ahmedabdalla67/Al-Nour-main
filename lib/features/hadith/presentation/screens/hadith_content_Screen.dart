import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';

class HadithContentScreen extends StatelessWidget {
  const HadithContentScreen({super.key, required this.content});
  final List<HadithEntity> content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadith Content'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 200,
            color: ManageColors.gray.withOpacity(0.5),
            child: Text(content.isNotEmpty ? content[1].hadithText : ''),
          );
        },
      ),
    );
  }
}
