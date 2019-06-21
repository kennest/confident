import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:confident/bloc/auth/bloc.dart';
import 'package:confident/tasks/FireBaseTasks.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var firebaseTask = FireBaseTasks();

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoginEvent) {
      yield LoadingAuthState();
      await firebaseTask.verifyPhone(event.number);
      yield SmsCodeSendAuthState();
    }else if(event is SendSmsCodeEvent){
      yield LoadingAuthState();
      FirebaseUser user=await firebaseTask.signInWithPhoneNumber(event.code);
      yield LoggedInAuthState(user);
    }
  }
}
