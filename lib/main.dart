import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/pages/account_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/guest_details_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/home_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/notification_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/wallet_page.dart';
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
      routes: {
        HomePage.nameRoute: (context) => const HomePage(),
        WalletPage.nameRoute: (context) => const WalletPage(),
        NotificationPage.nameRoute: (context) => const NotificationPage(),
        AccountPage.nameRoute: (context) => const AccountPage(),
        GuestDetails.nameRoute: (context) => const GuestDetails(),
      },
    );
  }
}
