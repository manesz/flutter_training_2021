import 'dart:async';
import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:demo0/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is LoginEvent_Login) {
        // Login
        _doLogin(event.payload);
      } else if (event is LoginEvent_Register) {
        // Register
        print("Register Bloc");
      } else if (event is LoginEvent_Forgot) {
        // Forgot
        print("Forgot Bloc");
      }
    });
  }

  Future<void> _doLogin(User payload) async {
    final String username = payload.username;
    final String password = payload.password;

    if (username == 'admin' && password == 'password') {
      // method 1
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage(),),);

      // method 2
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppSetting.token, 'TExkgk0494oksrkf');
      await prefs.setString(AppSetting.username, username);

      Navigator.pushReplacementNamed(context, AppRoute.home);
    } else {
      print("Login failed");
    }
  }
}
