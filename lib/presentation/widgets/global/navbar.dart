import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../core/utils/colors.dart';
import '../../pages/home/main_home_page.dart';
import '../../pages/payment/main_payment_page.dart';
import '../../pages/profile/main_profile_page.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final RxInt _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
      onItemSelected: (index) {
        _selectedIndex.value = index;
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const PaymentPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Homepage"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: AppColor.textSmall,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.payment),
        title: ("Payment"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: AppColor.textSmall,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: AppColor.textSmall,
      ),
    ];
  }
}
