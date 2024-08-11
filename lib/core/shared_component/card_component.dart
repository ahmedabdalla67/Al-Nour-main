import 'package:flutter/material.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,this.padding = 10, required this.cardColor, required this.cardImagePath, required this.cardTitle, required this.onTap,
    });

  final Color cardColor;
  final String cardImagePath;
  final String cardTitle;
  final Function() onTap;
   final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: padding),
        child: Container(
          height: 165,
          width: 140,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(cardImagePath, height: 100,),
            const SizedBox(height: 12,),
            Text(cardTitle, style: getApplicationTheme().textTheme.headlineLarge,),
          
          ],),
        ),
      ),
    );
  }
}