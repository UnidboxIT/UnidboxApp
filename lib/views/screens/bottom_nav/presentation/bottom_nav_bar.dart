import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/main_screen.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../repository/bottom_nav_state_notifier.dart';

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

Widget bottomNavBarWidget(
    int currentIndex,
    BottomNavNotifierController bottomNavNotifier,
    WidgetRef ref,
    BuildContext context,
    {bool needControl = false}) {
  return BottomAppBar(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    height: 55,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: const CircularNotchedRectangle(),
    notchMargin: 10,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: bottomNavNotifier.navBarList
          .map(
            (e) => GestureDetector(
              onTap: () {
                if (e.id != 2) {
                  ref
                      .read(bottomNavNotifierControllerProvider.notifier)
                      .setIndex(e.id);
                  if (needControl) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                      (route) => false,
                    );
                  }
                }
              },
              child: Container(
                width: 12.w,
                height: e.id != 2 ? 50 : 0,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    e.id == currentIndex ? e.selectedIcon : e.unselectedIcon,
                    e.id == currentIndex
                        ? textWidget(
                            e.name,
                            fontWeight: FontWeight.w600,
                            size: 9,
                            color: AppColor.primary,
                          )
                        : const SizedBox(
                            height: 5,
                          ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
