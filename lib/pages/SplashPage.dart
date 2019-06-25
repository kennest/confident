import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _getPermissions();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushNamed(context, "/login");
    });
  }

  _getPermissions()async{
    await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    await PermissionHandler().checkPermissionStatus(PermissionGroup.microphone);
    await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
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
