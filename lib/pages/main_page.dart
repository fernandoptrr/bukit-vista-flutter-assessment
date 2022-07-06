import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/components/bottom_navigation_bar.dart';
import 'package:flutter_bukit_vista_assessment/pages/account_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/home_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/notification_page.dart';
import 'package:flutter_bukit_vista_assessment/pages/wallet_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const nameRoute = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  final _screens = [
    const HomePage(),
    const WalletPage(),
    const NotificationPage(),
    const AccountPage(),
  ];
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: _screens),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() => _selectedIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
