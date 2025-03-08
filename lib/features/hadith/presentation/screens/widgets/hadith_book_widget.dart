import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';

class HadithBookWidget extends StatelessWidget {
  const HadithBookWidget(
      {super.key, required this.fileName, required this.index});
  final List<String> fileName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: ManageColors.white,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 0.5, color: ManageColors.gray.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          const Icon(Icons.book),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(fileName[index]),
              // SizedBox(height: 3,),
              const Text('no hadith')
            ],
          ),
          const Spacer(),
          const Icon(Icons.file_download_outlined)
        ],
      ),
    );
  }
}
