import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/view/login_page.dart';
import '../../login/login.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments) as String;
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('UserId: $arguments'),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  LoginPage.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// return const Text('Rahul');


