import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  static const nameRoute = '/notification';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Coming Soon \nš·āāļøš§š·āāļø',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
