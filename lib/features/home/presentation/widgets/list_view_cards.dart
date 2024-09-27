import 'package:flutter/material.dart';
import 'package:mesk/core/functions/custom_navigation.dart';
import 'package:mesk/core/shared_component/card_component.dart';
import 'package:mesk/core/utils/colors.dart';

class ListViewCards extends StatelessWidget {
  const ListViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/quran_card.png', cardTitle: 'القران الكريم', onTap: (){customNavigate(context, '/fehres');}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/praying.png', cardTitle: 'الأدعية والأذكار', onTap: (){}),
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/listening.png', cardTitle: 'القراء', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/al_rouqia.png', cardTitle: 'الرقية الشرعية', onTap: (){}),
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/islamic_library.png', cardTitle: 'كتب اسلامية', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), cardImagePath: 'assets/images/rasory.png', cardTitle: 'المسبحة', onTap: (){}),
        CardComponent(cardColor: ManageColors.card1.withOpacity(0.65), cardImagePath: 'assets/images/qibla.png', cardTitle: 'اتجاه القبلة', onTap: (){}),
        CardComponent(cardColor: ManageColors.card2.withOpacity(0.65), padding: 0, cardImagePath: 'assets/images/al_salaah.png', cardTitle: 'مواقيت الصلاة', onTap: (){}),
      ],
    );
    
  }
}