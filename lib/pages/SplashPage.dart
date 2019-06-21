import 'package:confident/repository/userRepository.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushNamed(context, "/login");
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
