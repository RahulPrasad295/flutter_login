import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/home.dart';
import '../login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    userName = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            buildErrorLayout(state.message);
          } else if (state is LoginSuccess) {
            clearTextData();
            Navigator.pushReplacementNamed(
              context,
              HomePage.routeName,
              arguments: state.uuid,
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue[600],
              ),
            );
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }

  Widget buildInitialInput() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userName,
                decoration: const InputDecoration(
                  label: Text('Username'),
                  icon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  icon: Icon(Icons.security),
                ),
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginButtonClick(
                      userName.text,
                      password.text,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );

  ScaffoldFeatureController buildErrorLayout(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[400],
        ),
      );

  void clearTextData() {
    userName.clear();
    password.clear();
  }
}
