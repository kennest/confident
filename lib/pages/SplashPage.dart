import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _getPermissions();
    _saveId();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  _saveId() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("id", "+225 08 01 00 05");
  }

  _getPermissions() async {
    await PermissionHandler().requestPermissions([
      PermissionGroup.contacts,
      PermissionGroup.storage,
      PermissionGroup.microphone,
      PermissionGroup.location,
      PermissionGroup.camera
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
