
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
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
      ),
      body: Column(
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
            child: const Text("Add Video"),
          ),
          ElevatedButton(
              onPressed: () async {
                print("PRESSED");
                List<String> videos = await _firestoreServices.getVideoUrls();
                print(videos);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoScreen(videoUrl: videos)));
              },
              child: Text('SEE REELS')),
        ],
      ),
    );
  }
}