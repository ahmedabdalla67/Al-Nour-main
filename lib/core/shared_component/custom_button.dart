import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.textColor = ManageColors.black,
    this.width = 100,
    this.onPressed,
  });

  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.8,
          color: ManageColors.gray,
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: getApplicationTheme()
                  .textTheme
                  .titleMedium!
                  .copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
