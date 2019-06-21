import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:confident/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  http.Response response;
  User u;
  final databaseReference = FirebaseDatabase.instance.reference();

  //Launch login
  Future<User> doLogin(User u) async {
    u.email = "lightbot78";
    u.password = "kenny1990";
    response = await http.post("http://178.33.130.202:8000/login/",
        body: {'username': u.email, 'password': u.password});
    print(response.body);
    databaseReference
        .child("data")
    .child(u.email)
        .set({'title': 'Mastering EJB', 'description': response.body});
    //u=json.decode(response.body);
    return u;
  }

  void getData() {
    databaseReference.child('data').once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}
