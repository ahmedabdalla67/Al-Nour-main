import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.color, this.textColor = ManageColors.black, this.width = 100,
  });

  final String text;
  final Color color;
  final Color textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
          color: color, 
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.3, color: ManageColors.gray),
          ),
          
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text(
              
              text,
              style: getApplicationTheme().textTheme.titleMedium!.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
