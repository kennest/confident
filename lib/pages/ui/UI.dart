import 'package:flutter/material.dart';
class UI {

  //To generate an AppBar for the whole application
  Widget appBar(String title,List<Widget> actions){
    return AppBar(
      actions: actions,
      title: Text(title),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}

