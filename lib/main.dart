import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/bloc/login_bloc.dart';
import 'login/view/login_page.dart';
import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        HomePage.routeName: (context) => BlocProvider.value(
              value: LoginBloc(),
              child: HomePage(),
            ),
        LoginPage.routeName: (context) => BlocProvider.value(
              value: LoginBloc(),
              child: const LoginPage(),
            ),
      },
    );
  }
}
