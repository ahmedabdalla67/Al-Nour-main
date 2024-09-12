import 'package:flutter/material.dart';
import 'package:mesk/core/shared_component/card_component.dart';
import 'package:mesk/core/utils/colors.dart';

class ListViewCards extends StatelessWidget {
  const ListViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), padding: 0, cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){}),
      ],
    );
    
  }
}