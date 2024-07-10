import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/profile/domain/profile.dart';
import 'package:unidbox_app/views/screens/profile/presentation/change_password/change_password_screen.dart';
import 'package:unidbox_app/views/screens/profile/presentation/personal_info_update/personal_info_update_screen.dart';
import 'package:unidbox_app/views/screens/profile/presentation/widgets/each_list_tile_widget.dart';
import 'package:unidbox_app/views/screens/profile/presentation/widgets/logout_widget.dart';
import 'package:unidbox_app/views/screens/profile/presentation/widgets/profile_image_widget.dart';
import 'package:unidbox_app/views/screens/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/views/screens/profile/repository/state/profile_state.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';

class ProfileBodyWidget extends ConsumerStatefulWidget {
  const ProfileBodyWidget({super.key});

  @override
  ConsumerState<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends ConsumerState<ProfileBodyWidget> {
  Profile profile = Profile();
  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(profileStateNotifierProvider.notifier).getPartnerInfo();
    });
  }

  toggleSwitch(value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (pre, next) {
      if (next is ProfileData) {
        setState(() {
          profile = next.profile;
          superPrint(profile);
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonalInfoUpdateScreen(
                        profile: profile,
                      )));
            },
          ),
          ListTile(
            onTap: () {},
            leading: Icon(CupertinoIcons.bell_fill,
                color: AppColor.pinkColor, size: 23),
            contentPadding: EdgeInsets.zero,
            title: textWidget(
              "Notifications",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            trailing: Transform.scale(
              scale: 0.6,
              alignment: Alignment.centerRight,
              child: CupertinoSwitch(
                value: isSwitched,
                onChanged: (value) {
                  toggleSwitch(value);
                },
                thumbColor: Colors.white,
                activeColor: AppColor.primary,
                trackColor: Colors.grey,
              ),
            ),
          ),
          eachListTileWidget(
              Icons.calendar_month, "Leave", AppColor.orangeColor, () {}),
          eachListTileWidget(CupertinoIcons.padlock_solid, "Change Password",
              AppColor.pinkColor, () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChangePasswordScreen(),
              ),
            );
          }),
          const Spacer(),
          logoutWidget(ref, context),
          SizedBox(height: 7.h)
        ],
      ),
    );
  }
}
