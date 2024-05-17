import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/auth/presentation/widgets/each_text_field_widget.dart';
import 'package:unidbox_app/auth/presentation/widgets/login_button_widget.dart';
import 'package:unidbox_app/auth/presentation/widgets/login_image_widget.dart';
import 'package:unidbox_app/auth/presentation/widgets/remember_me_widget.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../views/widgets/text_widget.dart';

class AuthLoginScreen extends ConsumerStatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthLoginScreenState();
}

class _AuthLoginScreenState extends ConsumerState<AuthLoginScreen> {
  TextEditingController txtUserID = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: Colors.white,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: loginImageWidget()),
              SizedBox(height: 7.h),
              textWidget("Employee ID", fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              eachTextFieldWidget(txtUserID, "Employee ID"),
              SizedBox(height: 3.h),
              textWidget("Password", fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              eachPasswordWidget(txtPassword, "Password"),
              const SizedBox(height: 20),
              rememberMeWidget(ref),
              SizedBox(height: 5.h),
              loginButtonWidget(txtUserID, txtPassword, context, ref),
            ],
          ),
        ),
      ),
    );
  }
}
