import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Sending, Recording }

class ChatRepository with ChangeNotifier {
  FlutterSound flutterSound = new FlutterSound();
  File _imageFile;
  String _imageUrl;
  String _groupChatId;
  final String id;
  final String peerId;
  StreamSubscription _recorderSubscription;
  Status _status = Status.Uninitialized;
  Status get status => _status;

  ChatRepository(this.id, this.peerId);

  //Start recording...
  Future<void> recordAudio() async {
    // Directory dir = await getApplicationDocumentsDirectory();
    //String path = dir.path;
    //String audioPath = await FlutterSound().startRecorder(null);
    //print('startRecorder: $audioPath');
    // _recorderSubscription = FlutterSound().onPlayerStateChanged.listen((e) {
    // if (e != null) {
    //   DateTime date =
    //       new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
    //    String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
//        this.setState(() {
//          this._isPlaying = true;
//          this._playerTxt = txt.substring(0, 8);
//        });
    //  }
    // });
    //print(audioPath);
    //_imageFile = File(audioPath);
    // uploadFile(_imageFile);
  }

//Stop recording
  Future<String> stopRecord() async {
    String msg = await flutterSound.stopRecorder();
    _recorderSubscription.cancel();
    return msg;
  }

  //Choose an image from gallery to send it
  Future getImage() async {
    _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_imageFile != null) {
      //setState(() {
      //  isLoading = true;
      //});
      uploadFile(_imageFile);
    }
  }

  //upload a file to Firestore
  Future uploadFile(File f) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putFile(f);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      _imageUrl = downloadUrl;
      // setState(() {
      // isLoading = false;
      onSendMessage(_imageUrl, 1);
      //});
    }, onError: (err) {
      print("Error -> ${err.toString()}");
      //setState(() {
      // isLoading = false;
      //});
      Fluttertoast.showToast(msg: 'This file is not an image');
    });
  }

  //Send a Message
  void onSendMessage(String content, int type) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      //textEditingController.clear();
      var documentReference = Firestore.instance
          .collection('messages')
          .document(_groupChatId)
          .collection(_groupChatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'idFrom': id,
            'idTo': peerId,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'type': type
          },
        );
      });
      //listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  //Create or get it groupChatId;
  readLocal(String peerId) async {
    var prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id') ?? '';
    if (id.hashCode <= peerId.hashCode) {
      _groupChatId = '$id-$peerId';
    } else {
      _groupChatId = '$peerId-$id';
    }
    //setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _recorderSubscription.cancel();
  }
}
