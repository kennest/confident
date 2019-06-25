import 'dart:async';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

class ChatRepository {
  FlutterSound flutterSound = new FlutterSound();

  //Start recording...
  Future<String> recordAudio(String audioPath) async {
    Directory dir = await getExternalStorageDirectory();
    String path = dir.path;
    audioPath = await flutterSound.startRecorder(path);
    return audioPath;
  }

//Stop recording
  Future<String> stopRecord()async{
    String msg= await flutterSound.stopRecorder();
    return msg;
  }
}
