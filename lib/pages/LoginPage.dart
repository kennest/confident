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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(45.0, 50.0, 45.0, 0.0),
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
            TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
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
                  onPressed: () {},
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
                    shape: CircleBorder(side: BorderSide(color: Colors.white)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
