import 'package:flutter/material.dart';

class GuestDetails extends StatelessWidget {
  const GuestDetails({Key? key}) : super(key: key);

  static const nameRoute = '/guest-details';

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
