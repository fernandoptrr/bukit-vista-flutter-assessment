import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static const nameRoute = '/account';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Coming Soon \n👷‍♀️🚧👷‍♂️',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
