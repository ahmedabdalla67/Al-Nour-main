import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class VideoCard extends StatelessWidget {
  final String videoId;
  final String videoTitle;

  const VideoCard({super.key, required this.videoId, required this.videoTitle});

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/mqdefault.jpg';

    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0.4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: thumbnailUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                videoTitle,
                style: getApplicationTheme().textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => VideoPlayerPage(videoId: videoId),
                //   ),
                // );
              },
              child: Text('Watch Video'),
            ),
          ],
        ),
      ),
    );
  }
}
