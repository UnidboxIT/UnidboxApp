import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/auth/repository/auth_state_notifier_controller.dart';
import 'package:unidbox_app/controllers/nav_bar_controller.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'bottom_nav/presentation/bottom_nav_bar.dart';
import 'bottom_nav/repository/bottom_nav_state_notifier_controller.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(NavBarController());
//     return SuperScaffold(
//       topColor: const Color(0xffF6F6F6),
//       botColor: Colors.white,
//       child: Scaffold(
//         backgroundColor: const Color(0xffF6F6F6),
//         body: GetBuilder<NavBarController>(builder: (controller) {
//           return controller.indexWidgets[controller.currentIndex];
//         }),
//         extendBody: true,
//         floatingActionButton: floatingActionBottomWidget(),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: bottomNavBarWidget(),
//       ),
//     );
//   }
// }

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final indexScreen = ref.watch(bottomNavNotifierControllerProvider.notifier);
    final currentIndex = ref.watch(bottomNavNotifierControllerProvider);
    return SuperScaffold(
      topColor: const Color(0xffF6F6F6),
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: indexScreen.indexWidgets[currentIndex],
        extendBody: true,
        floatingActionButton: floatingActionBottomWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavBarWidget(ref),
      ),
    );
  }
}
