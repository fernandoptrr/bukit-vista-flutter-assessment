import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  static const nameRoute = '/wallet';

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
