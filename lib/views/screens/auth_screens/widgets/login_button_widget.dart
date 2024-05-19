import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/auth/repository/auth_state_notifier.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget loginButtonWidget(TextEditingController txtUserID,
    TextEditingController txtPassword, context, WidgetRef ref) {
  ref.listen<AsyncValue<void>>(
    authStateNotifierControllerProvider,
    (_, state) => state.whenOrNull(error: (e, t) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }),
  );
  final authRepository = ref.read(authStateNotifierControllerProvider.notifier);
  final paymentState = ref.watch(authStateNotifierControllerProvider).isLoading;
  return Center(
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
          authRepository.signIn(
              txtUserID.text.trim(), txtPassword.text.trim(), ref, context);
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
  );
}
