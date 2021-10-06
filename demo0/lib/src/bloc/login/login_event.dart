part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Login Event
class LoginEvent_Login extends LoginEvent{
  final User payload;
  LoginEvent_Login(this.payload);
}

// Register Event
class RegisterEvent_Login extends LoginEvent{
  final User payload;
  RegisterEvent_Login(this.payload);
}


// Forgot Event
class ForgotEvent_Login extends LoginEvent{
  final String username;
  ForgotEvent_Login(this.username);
}
