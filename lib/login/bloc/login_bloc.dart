import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClick>((event, emit) async {
      emit(LoginLoading());
      await Future<void>.delayed(const Duration(seconds: 3));
      if (event.username.isEmpty || event.password.isEmpty)
        emit(LoginFailed('Email/Password field cant be empty'));
      else {
        final isValid = Repository().validate(event.username, event.password);

        if (isValid.success == true)
          emit(LoginSuccess(isValid.uuid));
        else
          emit(LoginFailed('Wrong Email/Password'));
      }
    });
    on<LogoutButtonClick>((event, emit) async {
      emit(LoginLoading());
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(LoginInitial());
    });
  }
}
