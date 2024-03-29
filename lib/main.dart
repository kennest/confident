import 'package:confident/pages/ChatRoomPage.dart';
import 'package:confident/pages/LoginPage.dart';
import 'package:confident/pages/SplashPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confident',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial-Rounded'),
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/chat': (context) => ChatRoomPage(),
      },
    );
  }
}
