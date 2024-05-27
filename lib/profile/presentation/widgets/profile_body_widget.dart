import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/domain/profile.dart';
import 'package:unidbox_app/profile/presentation/widgets/each_list_tile_widget.dart';
import 'package:unidbox_app/profile/presentation/widgets/logout_widget.dart';
import 'package:unidbox_app/profile/presentation/widgets/profile_image_widget.dart';
import 'package:unidbox_app/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/profile/repository/state/profile_state.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

class ProfileBodyWidget extends ConsumerStatefulWidget {
  const ProfileBodyWidget({super.key});

  @override
  ConsumerState<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends ConsumerState<ProfileBodyWidget> {
  Profile profile = Profile();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(profileStateNotifierProvider.notifier).getPartnerInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (pre, next) {
      if (next is ProfileData) {
        setState(() {
          profile = next.profile;
        });
      }
    });
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
              child: ProfileImageWidget(
            profileData: profile,
          )),
          eachListTileWidget(
            CupertinoIcons.person_fill,
            "Personal Information",
            AppColor.orangeColor,
            () async {
              // Get.to(() => const PersonalInfoUpdateScreen(),
              //     transition: Transition.circularReveal,
              //     duration: const Duration(seconds: 1));
            },
          ),
          eachListTileWidget(CupertinoIcons.bell_fill, "Notifications",
              AppColor.pinkColor, () {}),
          eachListTileWidget(
              Icons.calendar_month, "Leave", AppColor.orangeColor, () {}),
          eachListTileWidget(CupertinoIcons.padlock_solid, "Change Password",
              AppColor.pinkColor, () {
            // Get.to(
            //   () => const ChangePasswordScreen(),
            //   transition: Transition.circularReveal,
            //   duration: const Duration(seconds: 1),
            // );
          }),
          const Spacer(),
          logoutWidget(ref, context),
          SizedBox(height: 7.h)
        ],
      ),
    );
  }
}
