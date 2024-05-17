import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/auth_controllers/login_controller.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../widgets/text_widget.dart';
import 'package:unidbox_app/views/screens/auth_screens/widgets/each_text_field_widget.dart';
import 'widgets/login_button_widget.dart';
import 'widgets/login_image_widget.dart';
import 'widgets/remember_me_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SuperScaffold(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: bodyWidget(),
        ),
      ),
    );
  }

  Widget bodyWidget() {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: loginImageWidget()),
            SizedBox(height: 7.h),
            textWidget("Employee ID", fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            eachTextFieldWidget(controller.txtUserID, "Employee ID"),
            SizedBox(height: 3.h),
            textWidget("Password", fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            eachPasswordWidget(controller.txtPassword, "Password"),
            const SizedBox(height: 20),
            rememberMeWidget(),
            SizedBox(height: 5.h),
            //loginButtonWidget(),
          ],
        );
      },
    );
  }
}
