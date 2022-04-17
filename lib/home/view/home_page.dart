import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/view/login_page.dart';
import '../../login/login.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocProvider.value(
        value: BlocProvider.of<LoginBloc>(context),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LogoutButtonClick)
              Navigator.pushReplacementNamed(
                context,
                LoginPage.routeName,
              );
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      return const Text('State');
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        LogoutButtonClick(),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
