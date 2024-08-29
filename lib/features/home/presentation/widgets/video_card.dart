import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class VideoCard extends StatelessWidget {
  final String videoId;
  final String videoTitle;

  const VideoCard({super.key, required this.videoId, required this.videoTitle});

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/mqdefault.jpg';

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.2,
        //height: 180,
        child: Card(
          elevation: 0.4,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FittedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: thumbnailUrl,
                    //width: 200,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  videoTitle,
                  textDirection: TextDirection.rtl,
                  style: getApplicationTheme().textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  //padding: const EdgeInsets.symmetric(horizontal: 200 / 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ManageColors.primary),
                  child: Center(
                    child: Text(
                      'مشاهدة الفيديو',
                      style: getApplicationTheme()
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ManageColors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
