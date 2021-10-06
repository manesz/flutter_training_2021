import 'package:bloc/bloc.dart';
import 'package:demo0/src/app.dart';
import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:demo0/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(status: LoginStatus.init)) {
    on<LoginEvent_Login>(mapEventLoginToState);
    on<LoginEvent_Logout>(mapEventLogoutToState);
    on<LoginEvent_Register>((event, emit) => {logger.i("Register Bloc")});
    on<LoginEvent_Forgot>((event, emit) => {logger.i("Forgot Bloc")});
  }

  mapEventLoginToState(LoginEvent_Login event, Emitter emit) async {
    final String username = event.payload.username;
    final String password = event.payload.password;

    if (username == 'admin' && password == 'password') {
      // method 1
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage(),),);

      // method 2
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppSetting.token, 'TExkgk0494oksrkf');
      await prefs.setString(AppSetting.username, username);
      Navigator.pushReplacementNamed(
          navigatorState.currentContext!, AppRoute.home_v2);
      // Emit
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      print("Login failed");
    }
  }

  mapEventLogoutToState(LoginEvent_Logout event, Emitter emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppSetting.token);
    prefs.remove(AppSetting.username);
    Navigator.pushReplacementNamed(
        navigatorState.currentContext!, AppRoute.login);

    // Emit
    emit(state.copyWith(status: LoginStatus.init));
  }
}
