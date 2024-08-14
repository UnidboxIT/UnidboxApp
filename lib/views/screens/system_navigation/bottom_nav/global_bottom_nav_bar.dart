import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    unselectedIcon: Icons.home_filled,
    selectedIcon: Icons.home_filled,
    //name: "Home",
  ),
  NavBar(
    id: 1,
    unselectedIcon: Icons.calendar_month,
    selectedIcon: Icons.calendar_month,
    //name: "Calendar",
  ),
  NavBar(
    id: 2,
    selectedIcon: Icons.calendar_month,
    unselectedIcon: Icons.calendar_month,
    //name: "",
  ),
  NavBar(
    id: 3,
    unselectedIcon: Icons.sms_rounded,
    selectedIcon: Icons.sms_rounded,
    // name: "Message",
  ),
  NavBar(
    id: 4,
    unselectedIcon: CupertinoIcons.person_fill,
    selectedIcon: CupertinoIcons.person_fill,
    //name: "Profile",
  ),
];
