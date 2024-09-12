import 'package:flutter/material.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text(
              'متابعة',
              style: getApplicationTheme().textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
