import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'utils/constant/app_color.dart';
import 'views/screens/profile/presentation/profile_screen.dart';
import 'views/screens/system_navigation/bottom_nav/global_bottom_nav_bar.dart';
import 'views/screens/system_navigation/home_navigation.dart';
import 'views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentIndex = 0;
  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    homeNavRouteState,
  ];
  Future<bool> _systemBackButtonPressed(bool didPop) {
    if (navigatorKeys[currentIndex].currentState?.canPop() == true) {
      superPrint("HERE");
      navigatorKeys[currentIndex]
          .currentState
          ?.pop(navigatorKeys[currentIndex].currentContext);
    } else {
      superPrint("HI");
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    return Future.value(false);
  }

  List<Widget> indexWidgets = <Widget>[
    const HomeNavigationRoute(),
    Container(),
    Container(),
    Container(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    ref.watch(bottomBarVisibilityProvider);
    final isVisible = ref.watch(bottomBarVisibilityProvider.notifier).state;
    return PopScope(
      canPop: false,
      onPopInvoked: _systemBackButtonPressed,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        // body: indexWidgets[indexBottomNavbar],
        extendBody: true,
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: !isVisible
              ? const SizedBox.shrink()
              : floatingActionBottomWidget(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            !isVisible ? const SizedBox.shrink() : bottomNavBar(),
        body: SafeArea(
          top: false,
          child: IndexedStack(index: currentIndex, children: indexWidgets),
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      shadowColor: Colors.white,
      elevation: 20.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navBarList
            .map(
              (e) => GestureDetector(
                  onTap: () {
                    if (e.id != 2) {
                      if (currentIndex == e.id) {
                        navigatorKeys[currentIndex]
                            .currentState
                            ?.popUntil((route) => route.isFirst);
                      } else {
                        setState(() {
                          currentIndex = e.id;
                        });
                        if (currentIndex == 4) {
                          SystemChrome.setSystemUIOverlayStyle(
                            SystemUiOverlayStyle(
                              statusBarColor: AppColor.primary,
                            ),
                          );
                        }
                      }
                    }
                  },
                  child: Container(
                    width: 17.w,
                    height: e.id != 2 ? 60 : 0,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: e.id != 2
                        ? e.id == 4
                            ? Icon(
                                CupertinoIcons.person_fill,
                                size: e.id == currentIndex ? 4.h : 3.5.h,
                                color: e.id == currentIndex
                                    ? AppColor.primary
                                    : Colors.black.withOpacity(0.7),
                              )
                            : Image.asset(
                                e.selectedIcon,
                                height: e.id == currentIndex ? 3.5.h : 2.8.h,
                                color: e.id == currentIndex
                                    ? AppColor.primary
                                    : Colors.black.withOpacity(0.7),
                              )
                        : const SizedBox.shrink(),
                  )
                  // Container(
                  //     width: 17.w,
                  //     height: e.id != 2 ? 60 : 0,
                  //     color: Colors.transparent,
                  //     alignment: Alignment.center,
                  //     child: e.unselectedIcon,
                  //   ),
                  ),
            )
            .toList(),
      ),
    );
  }
}

 // e.id == currentIndex
//     ? textWidget(
//         e.name,
//         fontWeight: FontWeight.w600,
//         size: 15,
//         color: AppColor.primary,
//       )
//     : const SizedBox(
//         height: 5,
//       ),
