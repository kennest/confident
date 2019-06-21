import 'package:confident/models/user.dart';
import 'package:confident/services/authService.dart';
import 'package:flutter/widgets.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  User _user;
  Status _status = Status.Uninitialized;
  bool _authenticated;
  var authService=AuthService();

  Status get status => _status;
  User get user => _user;
  bool get authenticated => _authenticated;

  //Attempt login user
  Future<bool> signIn(User u) async {
    try {
      _status = Status.Authenticating;
      print("Authenticating");
      notifyListeners();
      _user=await authService.doLogin(u);
      authService.getData();
      if(_user!=null){
        _status = Status.Authenticated;
        print("Authenticated");
        notifyListeners();
      }
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      print("Unauthenticated");
      notifyListeners();
      return false;
    }
  }

  //Do Signout stuffs
  Future signOut() async {
    //_auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
