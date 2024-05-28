import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/controllers/nav_bar_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

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

Widget bottomNavBarWidget() {
  return GetBuilder<NavBarController>(builder: (controller) {
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
        children: controller.navBarList
            .map(
              (e) => GestureDetector(
                onTap: () {
                  if (e.id != 2) {
                    controller.changePage(e.id);
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
                      e.id == controller.currentIndex
                          ? e.selectedIcon
                          : e.unselectedIcon,
                      e.id == controller.currentIndex
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
  });
}
