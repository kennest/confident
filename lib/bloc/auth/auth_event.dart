import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class LoginEvent extends AuthEvent {
  final String number;
  LoginEvent(this.number);
}

class SendSmsCodeEvent extends AuthEvent {
  final String code;
  SendSmsCodeEvent(this.code);
}

