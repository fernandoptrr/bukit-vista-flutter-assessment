import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/theme/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {Key? key, this.selectedIndex = 0, required this.onItemTapped})
      : super(key: key);

  final Function(int index) onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      selectedItemColor: AppColor.primary,
      unselectedItemColor: AppColor.ink05,
      currentIndex: selectedIndex,
      iconSize: 26,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_home.png',
            color: selectedIndex == 0 ? AppColor.primary : AppColor.ink05,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_wallet.png',
            color: selectedIndex == 1 ? AppColor.primary : AppColor.ink05,
          ),
          label: "Wallet",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_notification.png',
            color: selectedIndex == 2 ? AppColor.primary : AppColor.ink05,
          ),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/icon_account.png',
            color: selectedIndex == 3 ? AppColor.primary : AppColor.ink05,
          ),
          label: "Account",
        ),
      ],
    );
  }
}
