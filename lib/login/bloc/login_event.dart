part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonClick extends LoginEvent {
  LoginButtonClick(this.username, this.password);

  final String username;
  final String password;
}

class LogoutButtonClick extends LoginEvent {}
