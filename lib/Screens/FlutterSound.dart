import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecorder extends StatefulWidget {
  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  late FlutterSoundRecorder _recorder;
  Directory? _recordingPath;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
  }

  Future<void> _startRecording() async {
    _recordingPath = await getTemporaryDirectory();
    try {
      await _recorder.openRecorder();
      await _recorder.startRecorder(
        codec: Codec.aacADTS,
        toFile: '${_recordingPath!.absolute}/temp_recording.aac',
      );
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder.stopRecorder();
      await _recorder.closeRecorder();
      setState(() {
        _isRecording = false;
      });
      // Store the recording in Firebase Storage
      final storage = FirebaseStorage.instance;
      final ref = storage
          .ref()
          .child('${_recordingPath!.absolute}/temp_recording.aac');
      await ref.putFile(File("${_recordingPath!.absolute}/temp_recording.aac"));
      // Delete the temporary recording file
      await File("${_recordingPath!.absolute}/temp_recording.aac").delete();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _recorder = FlutterSoundRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isRecording) Text('Recording...'),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
          ],
        ),
      ),
    );
  }
}
