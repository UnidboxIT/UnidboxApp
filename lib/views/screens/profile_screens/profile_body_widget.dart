import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

import 'widgets/each_list_tile_widget.dart';
import 'widgets/logout_widget.dart';
import 'widgets/profile_image_widget.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: profileImageWidget()),
          eachListTileWidget(
            CupertinoIcons.person_fill,
            "Personal Information",
            AppColor.orangeColor,
          ),
          eachListTileWidget(
            CupertinoIcons.bell_fill,
            "Notifications",
            AppColor.pinkColor,
          ),
          eachListTileWidget(
            Icons.calendar_month,
            "Leave",
            AppColor.orangeColor,
          ),
          eachListTileWidget(
            CupertinoIcons.padlock_solid,
            "Change Password",
            AppColor.pinkColor,
          ),
          const Spacer(),
          logoutWidget(),
          SizedBox(height: 7.h)
        ],
      ),
    );
  }
}
