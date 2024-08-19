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
    selectedIcon: "assets/images/selected_home.png",
  ),
  NavBar(
    id: 1,
    selectedIcon: "assets/images/selected_calender.png",
    //name: "Calendar",
  ),
  NavBar(
    id: 2,
    selectedIcon: "",
    //name: "",
  ),
  NavBar(
    id: 3,
    selectedIcon: "assets/images/selected_message.png",
    // name: "Message",
  ),
  NavBar(
    id: 4,
    selectedIcon: "",
    //name: "Profile",
  ),
];
