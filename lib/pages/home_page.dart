import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const nameRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Guest List",
        showBackButton: false,
        showSearchBar: true,
      ),
      body: const SafeArea(
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
