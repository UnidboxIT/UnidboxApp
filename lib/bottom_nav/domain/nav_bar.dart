import 'package:flutter/material.dart';

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
