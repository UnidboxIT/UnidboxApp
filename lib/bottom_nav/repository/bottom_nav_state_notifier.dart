import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/home/presentation/home_screen.dart';
import 'package:unidbox_app/profile/presentation/profile_screen.dart';

import '../../utils/constant/app_color.dart';
import '../domain/nav_bar.dart';

final bottomNavNotifierControllerProvider =
    StateNotifierProvider<BottomNavNotifierController, int>((ref) {
  return BottomNavNotifierController();
});

class BottomNavNotifierController extends StateNotifier<int> {
  BottomNavNotifierController() : super(0);

  final List<Widget> indexWidgets = <Widget>[
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    const ProfileScreen(),
  ];

  List<NavBar> navBarList = [
    NavBar(
      id: 0,
      unselectedIcon: Icon(
        Icons.home_filled,
        color: Colors.black.withOpacity(0.7),
      ),
      selectedIcon: Icon(
        Icons.home_filled,
        color: AppColor.primary,
      ),
      name: "Home",
    ),
    NavBar(
      id: 1,
      unselectedIcon: Icon(
        Icons.calendar_month,
        color: Colors.black.withOpacity(0.7),
      ),
      selectedIcon: Icon(
        Icons.calendar_month,
        color: AppColor.primary,
      ),
      name: "Calendar",
    ),
    NavBar(
      id: 2,
      selectedIcon: const SizedBox.shrink(),
      unselectedIcon: const SizedBox.shrink(),
      name: "",
    ),
    NavBar(
      id: 3,
      unselectedIcon: Icon(
        Icons.sms_rounded,
        color: Colors.black.withOpacity(0.7),
      ),
      selectedIcon: Icon(
        Icons.sms_rounded,
        color: AppColor.primary,
      ),
      name: "Message",
    ),
    NavBar(
      id: 4,
      unselectedIcon: Icon(
        CupertinoIcons.person_fill,
        color: Colors.black.withOpacity(0.7),
      ),
      selectedIcon: Icon(
        CupertinoIcons.person_fill,
        color: AppColor.primary,
      ),
      name: "Profile",
    ),
  ];

  void setIndex(int index) {
    state = index;
  }
}
