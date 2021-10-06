part of 'login_bloc.dart';

enum LoginStatus { fetching, success, faild, init }

class LoginState extends Equatable {
  final LoginStatus? status;

  LoginState({this.status});

  LoginState copyWith({LoginStatus? status}){
    return LoginState(status: status ?? this.status);
  }

  @override
  String toString() {
    return '''LoginState { status: $status }''';
  }

  @override
  List<Object> get props => [];
}
