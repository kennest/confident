import 'dart:isolate';

import 'package:confident/models/user.dart';
import 'package:confident/pages/pages.dart';
import 'package:confident/repository/userRepository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Country _selected;
  String countryCode;
  String smsCode = "";
  num phoneNo;
  var controller = TextEditingController();
  UserRepository userRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userRepository=UserRepository();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => userRepository,
      child: Consumer(
        builder: (context, UserRepository user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return main();
            case Status.Unauthenticated:
              return main();
            case Status.Authenticating:
             return Center(
               child: CircularProgressIndicator(),
             );
            case Status.Authenticated:
              return HomePage(user: user.user,);
          }
        },
      ),
    );
  }

  Widget main() {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
        padding: EdgeInsets.fromLTRB(45.0, 50.0, 45.0, 80.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.blue.withOpacity(0.5), BlendMode.srcATop),
                image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Text(
              "WELCOME",
              style: TextStyle(color: Colors.white70, fontSize: 40.0),
            ),
            SizedBox(
              height: 25.0,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 90.0,
              width: 90.0,
            ),
            Text(
              "Confident",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 90.0,
            ),
            CountryPicker(
              dense: false,
              showFlag: true,
              //displays flag, true by default
              showDialingCode: true,
              //displays dialing code, false by default
              showName: true,
              //displays country name, true by default
              onChanged: (Country country) {
                setState(() {
                  _selected = country;
                });
              },
              selectedCountry: _selected,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                controller: controller,
                onSaved: (input) => phoneNo = num.tryParse(input),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                  ),
                  fillColor: Colors.white,
                  hintText: "08 00 00 00",
                )),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: 250.0,
              child: OutlineButton(
                  color: Colors.blue,
                  splashColor: Colors.blue,
                  child: Text(
                    "Suivant",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    //print( '$_selected.dialingCode  ${num.tryParse(controller.text).toString()}');
                    User u=User();
                    await userRepository.signIn(u);
                  },
                  borderSide: BorderSide(color: Colors.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                OutlineButton.icon(
                    padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                    label: Text(""),
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(color: Colors.white),
                    onPressed: () {},
                    shape: CircleBorder(side: BorderSide(color: Colors.white))),
                OutlineButton.icon(
                    padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                    label: Text(""),
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    borderSide: BorderSide(color: Colors.white),
                    shape: CircleBorder(side: BorderSide(color: Colors.white))),
                OutlineButton.icon(
                    padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                    label: Text(""),
                    icon: Icon(
                      FontAwesomeIcons.googlePlusG,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    borderSide: BorderSide(color: Colors.white),
                    shape: CircleBorder(side: BorderSide(color: Colors.white)))
              ],
            )
          ],
        ),
      ),
      )
    );
  }

  //Show confirmation code dialog
  _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Entrer le code recu par sms:"),
          content: TextField(
            onChanged: (value) {
              smsCode = value;
            },
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Envoyer"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
