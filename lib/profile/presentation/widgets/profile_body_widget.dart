import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/presentation/widgets/logout_widget.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

class ProfileBodyWidget extends ConsumerWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          // Center(child: profileImageWidget()),
          // eachListTileWidget(
          //   CupertinoIcons.person_fill,
          //   "Personal Information",
          //   AppColor.orangeColor,
          //   () async {
          //     Get.to(() => const PersonalInfoUpdateScreen(),
          //         transition: Transition.circularReveal,
          //         duration: const Duration(seconds: 1));
          //   },
          // ),
          // eachListTileWidget(CupertinoIcons.bell_fill, "Notifications",
          //     AppColor.pinkColor, () {}),
          // eachListTileWidget(
          //     Icons.calendar_month, "Leave", AppColor.orangeColor, () {}),
          // eachListTileWidget(CupertinoIcons.padlock_solid, "Change Password",
          //     AppColor.pinkColor, () {
          //   Get.to(
          //     () => const ChangePasswordScreen(),
          //     transition: Transition.circularReveal,
          //     duration: const Duration(seconds: 1),
          //   );
          // }),
          // const Spacer(),
          logoutWidget(ref, context),
          SizedBox(height: 7.h)
        ],
      ),
    );
  }
}
