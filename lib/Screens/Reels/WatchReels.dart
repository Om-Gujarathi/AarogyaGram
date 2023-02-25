import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vjti/Colors/color.dart';
import 'package:vjti/Screens/Reels/SeeReels.dart';

import '../../Services/FirestoreServices.dart';

class Reels extends StatelessWidget {
  Reels({super.key});

  final FirestoreServices _firestoreServices = FirestoreServices();

  @override
  Widget build(BuildContext context) {
    String? _videoLink;
    XFile? _video;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
        centerTitle: true,
        backgroundColor: kBlack,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _videoLink != null
              ? Container(
                  child: Image.network(_videoLink),
                )
              : Container(),
          ElevatedButton(
            onPressed: () async {
              _video =
                  await ImagePicker().pickVideo(source: ImageSource.gallery);
              _firestoreServices.storage("uid", _video!);
            },
            child: const Text(
              "ADD VIDEO",
              style: TextStyle(fontSize: 22),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                print("PRESSED");
                List<dynamic> videos = await _firestoreServices.getVideoUrls();
                if (videos.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoScreen(videoUrl: videos)));
                }
              },
              child: Text('SEE REELS', style: TextStyle(fontSize: 22))),
        ],
      ),
    );
  }
}
