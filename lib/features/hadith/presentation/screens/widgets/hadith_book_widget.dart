import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';

class HadithBookWidget extends StatelessWidget {
  const HadithBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ManageColors.white,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 0.5, color: ManageColors.gray.withOpacity(0.2)),
      ),
      child: const Column(
        children: [
          Icon(Icons.book),
          Text('Test Data'),
        ],
      ),
    );
  }
}
