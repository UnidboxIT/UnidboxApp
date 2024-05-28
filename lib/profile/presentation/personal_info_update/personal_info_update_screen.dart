import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/domain/country.dart';
import 'package:unidbox_app/profile/domain/profile.dart';
import 'package:unidbox_app/profile/domain/race.dart';
import 'package:unidbox_app/profile/domain/religion.dart';
import 'package:unidbox_app/profile/presentation/personal_info_update/dropdown_widget/race_dropdown_widget.dart';
import 'package:unidbox_app/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/profile/repository/state/country_state.dart';
import 'package:unidbox_app/profile/repository/state/profile_state.dart';
import 'package:unidbox_app/profile/repository/state/race_state.dart';
import 'package:unidbox_app/profile/repository/state/religion_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../change_password/profile_text_field_widget.dart';
import 'dropdown_widget/country_dropdown_widget.dart';
import 'dropdown_widget/religion_dropdown_widget.dart';

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
  Country selectedCountry = Country();
  Race selectedRace = Race();
  Religion selectedReligion = Religion();
  bool isUpdateInfo = false;

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
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (pre, next) {
      if (next is ProfileLoading) {
        setState(() {
          isUpdateInfo = true;
        });
      }
      if (next is ProfileData) {
        setState(() {
          isUpdateInfo = false;
        });
      }
    });
    ref.listen(countryStateNotifierProvider, (pre, next) {
      if (next is SelectedCountry) {
        setState(() {
          selectedCountry = next.country;
        });
      }
      superPrint(selectedCountry.name);
    });
    ref.listen(religionStateNotifierProvider, (pre, next) {
      if (next is SelectedReligion) {
        setState(() {
          selectedReligion = next.religion;
        });
        superPrint(selectedReligion.name);
      }
    });

    ref.listen(raceStateNotifierProvider, (pre, next) {
      if (next is SelectedRace) {
        setState(() {
          selectedRace = next.race;
        });
      }
    });

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
              CountryDropdownWidget(profile: widget.profile),
              const SizedBox(height: 13),
              textWidget(
                "Religion",
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              const SizedBox(height: 7),
              ReligionDropDownWidget(profile: widget.profile),
              const SizedBox(height: 13),
              textWidget(
                "Race",
                fontWeight: FontWeight.bold,
                size: 15,
              ),
              const SizedBox(height: 7),
              RaceDropdownWidget(profile: widget.profile),
              const SizedBox(height: 13),
              SizedBox(height: 4.h),
              Center(
                child: Container(
                  width: 40.w,
                  height: 40,
                  color: Colors.transparent,
                  child: buttonWidget("Update", () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    ref.read(countryStateNotifierProvider);
                    ref.read(religionStateNotifierProvider);
                    ref.read(raceStateNotifierProvider);
                    superPrint(selectedRace.name);
                    ref
                        .read(profileStateNotifierProvider.notifier)
                        .updatePartnerInfo(
                            txtFirstName.text,
                            txtLastName.text,
                            txtContactNumber.text,
                            txtEmail.text,
                            selectedCountry.id,
                            selectedReligion.id,
                            selectedRace.id,
                            context);
                  }, isBool: isUpdateInfo),
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
