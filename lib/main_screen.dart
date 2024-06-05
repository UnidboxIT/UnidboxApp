import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/home/repository/provider/home_provider.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'views/screens/bottom_nav/presentation/bottom_nav_bar.dart';
import 'views/screens/bottom_nav/repository/bottom_nav_state_notifier.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homeStateNotifierProvider);
    final currentIndex = ref.watch(bottomNavNotifierControllerProvider);
    final bottomNavNotifier =
        ref.watch(bottomNavNotifierControllerProvider.notifier);

    return SuperScaffold(
      topColor: const Color(0xffF6F6F6),
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: bottomNavNotifier.indexWidgets[currentIndex],
        extendBody: true,
        floatingActionButton: floatingActionBottomWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            bottomNavBarWidget(currentIndex, bottomNavNotifier, ref, context),
      ),
    );
  }
}
