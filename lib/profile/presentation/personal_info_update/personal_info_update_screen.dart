import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/domain/profile.dart';
import 'package:unidbox_app/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/profile/repository/state/country_state.dart';
import 'package:unidbox_app/profile/repository/state/profile_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/profile_screens/personal_info_update/dropdown_widget/race_dropdown_widget.dart';
import 'package:unidbox_app/views/screens/profile_screens/personal_info_update/dropdown_widget/religion_dropdown_widget.dart';
import 'package:unidbox_app/views/screens/profile_screens/widgets/profile_text_field_widget.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/country.dart';
import 'dropdown_widget/country_dropdown_widget.dart';

class PersonalInfoUpdateScreen extends ConsumerStatefulWidget {
  final Profile profile;
  const PersonalInfoUpdateScreen({super.key, required this.profile});

  @override
  ConsumerState<PersonalInfoUpdateScreen> createState() =>
      _PersonalInfoUpdateScreenState();
}

class _PersonalInfoUpdateScreenState
    extends ConsumerState<PersonalInfoUpdateScreen> {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtContactNumber = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  loadData() {
    setState(() {
      txtFirstName.text = widget.profile.firstName;
      txtLastName.text = widget.profile.lastName;
      txtContactNumber.text = widget.profile.phone;
      txtEmail.text = widget.profile.email;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            globalAppBarWidget("Personal Information", () {
              Navigator.of(context).pop();
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
      child: SingleChildScrollView(
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
                txtFirstName,
              ),
              titleAndTextFieldWidget(
                "Last Name",
                txtLastName,
              ),
              titleAndTextFieldWidget(
                "Contact Number",
                txtContactNumber,
                isNumber: true,
              ),
              titleAndTextFieldWidget(
                "Email",
                txtEmail,
              ),
              textWidget(
                "Nationality",
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              const SizedBox(height: 7),
              CountryDropdownWidget(
                profile: widget.profile,
              ),
              const SizedBox(height: 13),
              textWidget(
                "Religion",
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              const SizedBox(height: 7),
              // religionDropDownWidget(context),
              const SizedBox(height: 13),
              textWidget(
                "Race",
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              const SizedBox(height: 7),
              // raceDropDownWidget(context),
              const SizedBox(height: 13),
              SizedBox(height: 4.h),
              Center(
                child: Container(
                  width: 40.w,
                  height: 40,
                  color: Colors.transparent,
                  child: buttonWidget("Update", () {
                    final state = ref.read(countryStateNotifierProvider);
                    if (state is SelectedCountry) {
                      superPrint(state.country.name);
                    }
                  }),
                  //   controller.updatePartnerInfo();
                  // }, isBool: controller.isUpdateLoading),
                ),
              ),
            ],
          ),
        ),
      ),
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
