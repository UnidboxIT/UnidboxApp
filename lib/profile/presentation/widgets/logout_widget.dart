import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/presentation/widgets/logout_bottom_sheet.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import 'dart:math' as math;

Widget logoutWidget(WidgetRef ref, BuildContext context) {
  return GestureDetector(
    onTap: () {
      logoutBottomSheet(context, ref);
    },
    child: Container(
      width: 30.w,
      height: 50,
      color: Colors.transparent,
      child: Row(
        children: [
          Transform.rotate(
            angle: math.pi,
            child: Icon(
              Icons.logout,
              color: AppColor.pinkColor,
            ),
          ),
          const SizedBox(width: 10),
          textWidget(
            "Logout",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            size: 16,
          ),
        ],
      ),
    ),
  );
}
