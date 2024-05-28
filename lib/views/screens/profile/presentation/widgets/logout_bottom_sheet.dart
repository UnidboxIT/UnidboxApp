import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/auth/repository/auth_state_notifier.dart';
import 'dart:math' as math;
import 'package:unidbox_app/views/widgets/bottom_sheets/global_bottom_sheet.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';

logoutBottomSheet(context, ref) {
  return globalBottomSheet(logoutBottomSheetWidget(ref, context), context);
}

Widget logoutBottomSheetWidget(WidgetRef ref, context) {
  return Container(
    height: 30.h,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: const Color(0xffD8EDE5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: math.pi,
          child: Icon(
            Icons.logout,
            color: AppColor.pinkColor,
            size: 35,
          ),
        ),
        const SizedBox(height: 10),
        textWidget(
          "Logout",
          fontWeight: FontWeight.w900,
          size: 18,
        ),
        const SizedBox(height: 10),
        textWidget(
          "Are you sure you want to logout?",
          size: 13,
          color: AppColor.fontColor,
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: 30.w,
          height: 35,
          child: buttonWidget("Ok", () {
            ref
                .read(authStateNotifierControllerProvider.notifier)
                .logout(context, ref);

            // Get.put(LoginController()).logout();
          }),
        )
      ],
    ),
  );
}
