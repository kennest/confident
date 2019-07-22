import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:confident/models/user.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class AuthService {
  http.Response response;
  User u;

  //Launch login
  Future<User> doLogin(User u) async {
    var userDocument = Firestore.instance.collection('users').document(u.phone);

    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        userDocument,
        {
          'age': 0,
          'country': u.country,
          'created_at': DateTime.now().millisecondsSinceEpoch.toString(),
          'username': u.phone,
          'avatar': u.avatar,
          'phone': u.phone
        },
      );
    });

    //u=json.decode(response.body);
    return u;
  }
}
