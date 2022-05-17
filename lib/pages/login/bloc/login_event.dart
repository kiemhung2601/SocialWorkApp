part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class InitialEvent extends LoginEvent {}

class LoginUserEvent extends LoginEvent {
  final String studentId;
  final String studentPwd;

  const LoginUserEvent({required this.studentId, required this.studentPwd});
}
