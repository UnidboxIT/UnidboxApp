import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/profile_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/profile_screens/widgets/barcode_widget.dart';
import 'profile_body_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
    ));
    return SafeArea(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: GetBuilder<ProfileController>(
          builder: (controller) {
            return Stack(
              children: [
                barcodeWidget(),
                Transform.translate(
                  offset: Offset(0, 7.h),
                  child: const ProfileBodyWidget(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}