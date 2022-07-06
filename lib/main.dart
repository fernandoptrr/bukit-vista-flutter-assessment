import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bukit_vista_assessment/cubits/booking_detail_cubit.dart';
import 'package:flutter_bukit_vista_assessment/cubits/list_guest_cubit.dart';
import 'package:flutter_bukit_vista_assessment/pages/account_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/guest_details_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/home_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/main_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ListGuestCubit()),
        BlocProvider(create: (_) => BookingDetailCubit()),
      ],
      child: MaterialApp(
        title: 'Bukit Vista',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        routes: {
          MainPage.nameRoute: (context) => const MainPage(),
          HomePage.nameRoute: (context) => const HomePage(),
          WalletPage.nameRoute: (context) => const WalletPage(),
          NotificationPage.nameRoute: (context) => const NotificationPage(),
          AccountPage.nameRoute: (context) => const AccountPage(),
          GuestDetails.nameRoute: (context) => const GuestDetails(),
        },
      ),
    );
  }
}
