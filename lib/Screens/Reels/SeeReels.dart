
import 'package:flutter/material.dart';
import 'package:vjti/Screens/Reels/VideoPlayerItem.dart';

class VideoScreen extends StatelessWidget {
  final List<String> videoUrl;
  VideoScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: videoUrl.length,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                VideoPlayerItem(videoUrl: videoUrl[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}