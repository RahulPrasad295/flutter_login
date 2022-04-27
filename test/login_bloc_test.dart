import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_login/login/bloc/login_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('CounterBloc', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = LoginBloc();
    });

    // blocTest<LoginBloc, LoginState>(
    //   'emits [1] when CounterIncrementPressed is added',
    //   build: () => loginBloc,
    //   act: (bloc) => bloc.add(LoginButtonClick('', '')),
    //   expect: () => [LoginFailed('Wrong Email/Password')],
    // );

    // blocTest(
    // 'emits [-1] when CounterDecrementPressed is added',
    // build: () => counterBloc,
    // act: (bloc) => bloc.add(CounterDecrementPressed()),
    // expect: () => [-1],
    // );
  });
}
