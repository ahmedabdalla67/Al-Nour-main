import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class HadithBookWidget extends StatelessWidget {
  const HadithBookWidget(
      {super.key,
      required this.fileName,
      required this.index,
      required this.isDownloaded,
      required this.onDownloadPressed,
      required this.onCardPressed});
  final List<String> fileName;
  final int index;
  final bool isDownloaded;
  final VoidCallback onDownloadPressed;
  final VoidCallback onCardPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 10),
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
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName[index]),
                // SizedBox(height: 3,),
                Text(
                  "‍٤‍‍٤حديث",
                  textDirection: TextDirection.rtl,
                  style: getApplicationTheme().textTheme.bodySmall,
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: onDownloadPressed,
                icon: isDownloaded
                    ? const Icon(Icons.download_done_outlined)
                    : const Icon(Icons.file_download_outlined))
          ],
        ),
      ),
    );
  }
}
