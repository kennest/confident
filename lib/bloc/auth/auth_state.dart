import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class InitialAuthState extends AuthState {}

class LoggedInAuthState extends AuthState {
  final FirebaseUser user;

  LoggedInAuthState(this.user);
}

class LoggedOutAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SmsCodeSendAuthState extends AuthState {
}
