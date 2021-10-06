import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/user.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is LoginEvent_Login) {
        // Login
        print("Login Bloc");
      } else if (event is LoginEvent_Register) {
        // Register
        print("Register Bloc");
      } else if (event is LoginEvent_Forgot) {
        // Forgot
        print("Forgot Bloc");
      }
    });
  }
}
