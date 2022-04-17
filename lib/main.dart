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
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        LoginPage.routeName: (_) => const LoginPage(),
      },
    );
  }
}
