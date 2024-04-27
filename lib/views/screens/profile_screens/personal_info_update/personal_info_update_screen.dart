import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/profile_controllers/profile_controller.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/profile_screens/personal_info_update/dropdown_widget/race_dropdown_widget.dart';
import 'package:unidbox_app/views/screens/profile_screens/personal_info_update/dropdown_widget/religion_dropdown_widget.dart';
import 'package:unidbox_app/views/screens/profile_screens/widgets/profile_text_field_widget.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import 'dropdown_widget/country_dropdown_widget.dart';

class PersonalInfoUpdateScreen extends StatelessWidget {
  const PersonalInfoUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pfController = Get.find<ProfileController>();
      pfController.getPartnerInfo();
      pfController.getCoutry();
      pfController.getReligion();
      pfController.getRace();
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            globalAppBarWidget("Personal Information", () {
              Get.back();
            }),
            Transform.translate(
              offset: Offset(0, 13.h),
              child: personalInfoUpdateWidget(context),
            )
          ],
        ),
      ),
    );
  }

  Widget personalInfoUpdateWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.bgColor, borderRadius: BorderRadius.circular(20)),
      child: GetBuilder<ProfileController>(builder: (controller) {
        return SingleChildScrollView(
          reverse: true,
          child: Container(
            width: 100.w,
            height: 90.h,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                titleAndTextFieldWidget(
                  "First Name",
                  controller.txtFirstName,
                ),
                titleAndTextFieldWidget(
                  "Last Name",
                  controller.txtLastName,
                ),
                titleAndTextFieldWidget(
                  "Contact Number",
                  controller.txtContactNumber,
                  isNumber: true,
                ),
                titleAndTextFieldWidget(
                  "Email",
                  controller.txtEmail,
                ),
                textWidget(
                  "Nationality",
                  fontWeight: FontWeight.bold,
                  size: 15,
                ),
                const SizedBox(height: 7),
                countryDropDownWidget(context),
                const SizedBox(height: 13),
                textWidget(
                  "Religion",
                  fontWeight: FontWeight.bold,
                  size: 15,
                ),
                const SizedBox(height: 7),
                religionDropDownWidget(context),
                const SizedBox(height: 13),
                textWidget(
                  "Race",
                  fontWeight: FontWeight.bold,
                  size: 15,
                ),
                const SizedBox(height: 7),
                raceDropDownWidget(context),
                const SizedBox(height: 13),
                SizedBox(height: 4.h),
                Center(
                  child: Container(
                    width: 40.w,
                    height: 40,
                    color: Colors.transparent,
                    child: buttonWidget("Update", () {
                      superPrint("Here");
                      Get.back();
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget titleAndTextFieldWidget(String name, TextEditingController controller,
      {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          name,
          fontWeight: FontWeight.bold,
          size: 15,
        ),
        const SizedBox(height: 7),
        profileTextFieldWidget(controller, name, isNumber: isNumber),
        const SizedBox(height: 13),
      ],
    );
  }
}
