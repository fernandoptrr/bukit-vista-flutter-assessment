import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/pages/home_page.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bukit Vista',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}
