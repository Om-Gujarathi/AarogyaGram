import 'package:flutter/material.dart';
import 'package:vjti/Screens/Reels/VideoPlayerItem.dart';

class VideoScreen extends StatefulWidget {
  List<dynamic> videoUrl;
  VideoScreen({super.key, required this.videoUrl});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.videoUrl.length,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(4.0),
            child: Stack(
              children: [
                VideoPlayerItem(videoUrl: widget.videoUrl[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
