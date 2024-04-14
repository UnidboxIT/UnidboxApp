import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/nav_bar_controller.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import 'views/widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return SuperScaffold(
      topColor: const Color(0xffF6F6F6),
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: GetBuilder<NavBarController>(builder: (controller) {
          return controller.indexWidgets[controller.currentIndex];
        }),
        extendBody: true,
        floatingActionButton: floatingActionBottomWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavBarWidget(),
      ),
    );
  }
}
