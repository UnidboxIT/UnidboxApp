import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/constant/app_color.dart';
import '../views/screens/home_screens/home_screen.dart';
import '../views/screens/profile_screens/profile_screen.dart';

class NavBar {
  int id;
  Widget unselectedIcon;
  Widget selectedIcon;
  String name;

  NavBar({
    required this.id,
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.name,
  });
}

class NavBarController extends GetxController {
  int currentIndex = 0;

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

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  final List<Widget> indexWidgets = <Widget>[
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    const ProfileScreen(),
  ];
}