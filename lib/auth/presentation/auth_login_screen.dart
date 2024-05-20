import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/auth/presentation/widgets/each_text_field_widget.dart';
import 'package:unidbox_app/auth/presentation/widgets/login_image_widget.dart';
import 'package:unidbox_app/auth/presentation/widgets/remember_me_widget.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../utils/constant/app_color.dart';
import '../../views/widgets/text_widget.dart';
import '../repository/auth_state_notifier.dart';
import '../repository/state/auth_state.dart';

class AuthLoginScreen extends ConsumerStatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthLoginScreenState();
}

class _AuthLoginScreenState extends ConsumerState<AuthLoginScreen> {
  TextEditingController txtUserID = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool paymentState = false;
  @override
  Widget build(BuildContext context) {
    ref.watch(authStateNotifierControllerProvider);
    ref.listen(authStateNotifierControllerProvider, (prev, next) {
      if (next is Loading) {
        setState(() {
          paymentState = true;
        });
      }
      if (next is Error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
        setState(() {
          paymentState = false;
        });
      }
      if (next is Success) {
        ref
            .watch(authStateNotifierControllerProvider.notifier)
            .checkUserAuthorization();
      }
    });
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
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 7,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      ref
                          .read(authStateNotifierControllerProvider.notifier)
                          .signIn(txtUserID.text.trim(),
                              txtPassword.text.trim(), ref, context);
                    },
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.white,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: paymentState
                        ? Center(
                            child: CupertinoActivityIndicator(
                              color: AppColor.primary,
                            ),
                          )
                        : textWidget(
                            "Login",
                            fontWeight: FontWeight.bold,
                          ),
                  ),
                ),
              )
              // loginButtonWidget(txtUserID, txtPassword, context, ref),
            ],
          ),
        ),
      ),
    );
  }
}
