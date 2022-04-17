part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess(
    this.uuid,
  );

  final String uuid;
}

class LoginFailed extends LoginState {
  LoginFailed(
    this.message,
  );

  final String message;
}
