import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../network/api_links.dart';

import '../../../network/exceptions.dart';
import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      try {
        if (event is LoginUserEvent) {
          debugPrint('Đang chạy');
          emit(state.updateWith(loginStatus: InitLoginStatus()));

          var map = <String, dynamic>{};
          map['username'] = event.studentId;
          map['password'] = event.studentPwd;

          debugPrint(event.studentId);
          debugPrint(event.studentPwd);

          var response = await Dio().post(ApiLinks.getAccessToken, data: map);
          debugPrint(response.toString());

          if(response.statusCode == 200){
            emit(state.updateWith(
                loginStatus: const LoginStatusSuccess(true)));
          }
        } else if (event is InitialEvent) {
          emit(state.updateWith(loginStatus: const InitLoginStatus()));
        }
      } on DioError catch (e) {
        if (state.loginStatus is InitLoginStatus) {
          emit(state.updateWith(
              loginStatus: LoginStatusFail(
                  responseError: DioExceptions.fromDioError(e).responseError)));
        }
      }
    });
  }
}
