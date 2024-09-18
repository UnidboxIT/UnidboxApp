import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'utils/commons/super_print.dart';
import 'utils/constant/app_color.dart';
import 'views/screens/messages/presentation/messages_screen.dart';
import 'views/screens/profile/presentation/profile_screen.dart';
import 'views/screens/system_navigation/bottom_nav/global_bottom_nav_bar.dart';
import 'views/screens/system_navigation/home_navigation.dart';
import 'views/screens/system_navigation/job_order_navigation.dart';
import 'views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';

final shorebirdCodePush = ShorebirdCodePush();

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentIndex = 0;
  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    homeNavRouteState,
    jobOrderNavRouteState,
  ];
  Future<bool> _systemBackButtonPressed(bool didPop) {
    if (navigatorKeys[currentIndex].currentState?.canPop() == true) {
      navigatorKeys[currentIndex]
          .currentState
          ?.pop(navigatorKeys[currentIndex].currentContext);
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    return Future.value(false);
  }

  List<Widget> indexWidgets = <Widget>[
    const HomeNavigationRoute(),
    const JobOrderNavigationRoute(),
    Container(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];

  Future<void> _checkForUpdates() async {
    // Check whether a patch is available to install.
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();
    await shorebirdCodePush.downloadUpdateIfAvailable();
    await Future.delayed(const Duration(milliseconds: 500));
    superPrint(isUpdateAvailable);
    if (isUpdateAvailable) {
      // Download the new patch if it's available.
      alertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((tp) {
      _checkForUpdates();
    });

    ref.watch(bottomBarVisibilityProvider);
    final isVisible = ref.watch(bottomBarVisibilityProvider.notifier).state;
    return PopScope(
      canPop: false,
      onPopInvoked: _systemBackButtonPressed,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        extendBody: true,
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: !isVisible
              ? const SizedBox.shrink()
              : floatingActionBottomWidget(context),
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
                                size: e.id == currentIndex ? 4.h : 3.2.h,
                                color: e.id == currentIndex
                                    ? AppColor.primary
                                    : Colors.black.withOpacity(0.7),
                              )
                            : Image.asset(
                                e.selectedIcon,
                                height: e.id == currentIndex ? 3.5.h : 2.7.h,
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

  Future<void> _downloadUpdate() async {
    await shorebirdCodePush.downloadUpdateIfAvailable();
    restartApp();
  }

  alertDialog() {
    return showDialog(
      context: context,
      builder: (context) => SizedBox(
        height: 25.h,
        child: PopScope(
          canPop: false,
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 35),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: Colors.white,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        "A new version is available! Please update to the latest version",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                        width: 40.w,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: buttonWidget(
                          "OK",
                          () {
                            Navigator.of(context).pop();
                            _downloadUpdate();
                          },
                          bgColor: AppColor.primary,
                          fontColor: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.1),
      barrierDismissible: false,
    );
  }

  restartApp() {
    return showDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 35),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "New Version is ready!. Please restart the application",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: buttonWidget(
                        "Restart App",
                        Restart.restartApp,
                        bgColor: AppColor.primary,
                        fontColor: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.1),
      barrierDismissible: false,
    );
  }
}
