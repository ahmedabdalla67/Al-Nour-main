import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 140,
      decoration: BoxDecoration(
        color: ManageColors.card1.withOpacity(0.65),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset('assets/images/quran_card.png', height: 100,),
        const SizedBox(height: 12,),
        Text('القران الكريم', style: getApplicationTheme().textTheme.headlineLarge,),
      
      ],),
    );
  }
}