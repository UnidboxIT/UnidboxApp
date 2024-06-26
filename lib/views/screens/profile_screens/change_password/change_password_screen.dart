import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/profile_controllers/change_password_controller.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../widgets/profile_text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            globalAppBarWidget("Change Password", () {
              Get.back();
            }),
            Transform.translate(
              offset: Offset(0, 13.h),
              child: changePasswordBodyWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget changePasswordBodyWidget() {
    return GetBuilder<ChangePasswordController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.bgColor,
        ),
        child: Container(
          width: 100.w,
          height: 90.h,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget("Old Password", fontWeight: FontWeight.bold, size: 14),
              const SizedBox(height: 7),
              profileTextFieldWidget(
                controller.txtOldPwd,
                "Old Password",
              ),
              const SizedBox(height: 15),
              textWidget("New Password", fontWeight: FontWeight.bold, size: 14),
              const SizedBox(height: 7),
              profileTextFieldWidget(
                controller.txtNewPwd,
                "New Password",
              ),
              const SizedBox(height: 15),
              textWidget("Confirm New Password",
                  fontWeight: FontWeight.bold, size: 14),
              const SizedBox(height: 7),
              profileTextFieldWidget(
                controller.txtConfirmPwd,
                "Confirm New Password",
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Container(
                  width: 40.w,
                  height: 38,
                  color: Colors.transparent,
                  child: buttonWidget("Update", () {
                    if (controller.txtOldPwd.text.isEmpty) {
                      CommonMethods.customizedAlertDialog(
                          "Please enter old password",
                          isPop: false);
                    } else if (controller.txtNewPwd.text.isEmpty) {
                      CommonMethods.customizedAlertDialog(
                          "Please enter new password",
                          isPop: false);
                    } else if (controller.txtOldPwd.text.isEmpty) {
                      CommonMethods.customizedAlertDialog(
                          "Please enter confirm new password",
                          isPop: false);
                    } else {
                      controller.changePwd();
                    }
                  }, isBool: controller.isUpdateLoading),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
