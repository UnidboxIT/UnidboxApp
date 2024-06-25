import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'nav_bar.dart';

Widget floatingActionBottomWidget() {
  return FloatingActionButton(
    onPressed: () {},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    backgroundColor: Colors.black.withOpacity(0.8),
    elevation: 0,
    child: const Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}

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
