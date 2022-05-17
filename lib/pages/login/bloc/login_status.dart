
import '../../../network/exceptions.dart';

abstract class LoginStatus {
  const LoginStatus();
}

class InitLoginStatus extends LoginStatus {
  const InitLoginStatus();
}

class FormSubmitting extends LoginStatus {}

class LoginStatusFail extends LoginStatus {
  final ResponseError? responseError;

  LoginStatusFail({this.responseError});

  List<Object?> get props => [responseError];
}

class LoginStatusSuccess extends LoginStatus {
  final bool login;

  const LoginStatusSuccess(this.login);
  //
  // // TODO: implement props
  List<Object?> get props => [login];
}