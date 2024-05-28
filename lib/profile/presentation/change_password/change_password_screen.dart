import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/presentation/change_password/profile_text_field_widget.dart';
import 'package:unidbox_app/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/profile/repository/state/change_pwd_state.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../utils/commons/common_method.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  TextEditingController txtOldPwd = TextEditingController();
  TextEditingController txtNewPwd = TextEditingController();
  TextEditingController txtConfirmPwd = TextEditingController();
  bool isUpdateLoading = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(changePwdStateNotifierProvider, (prre, next) {
      if (next is Loading) {
        setState(() {
          isUpdateLoading = true;
        });
      }
      if (next is ChangePwdSuccess) {
        setState(() {
          isUpdateLoading = false;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            globalAppBarWidget("Change Password", () {
              Navigator.of(context).pop();
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
              txtOldPwd,
              "Old Password",
            ),
            const SizedBox(height: 15),
            textWidget("New Password", fontWeight: FontWeight.bold, size: 14),
            const SizedBox(height: 7),
            profileTextFieldWidget(
              txtNewPwd,
              "New Password",
            ),
            const SizedBox(height: 15),
            textWidget("Confirm New Password",
                fontWeight: FontWeight.bold, size: 14),
            const SizedBox(height: 7),
            profileTextFieldWidget(
              txtConfirmPwd,
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
                  if (txtOldPwd.text.isEmpty) {
                    CommonMethods.customizedAlertDialog(
                        "Please enter old password", context);
                  } else if (txtNewPwd.text.isEmpty) {
                    CommonMethods.customizedAlertDialog(
                        "Please enter new password", context);
                  } else if (txtOldPwd.text.isEmpty) {
                    CommonMethods.customizedAlertDialog(
                        "Please enter confirm new password", context);
                  } else {
                    ref.read(changePwdStateNotifierProvider.notifier).changePwd(
                        txtOldPwd.text,
                        txtNewPwd.text,
                        txtConfirmPwd.text,
                        context,
                        ref);
                  }
                }, isBool: isUpdateLoading),
              ),
            )
          ],
        ),
      ),
    );
  }
}
