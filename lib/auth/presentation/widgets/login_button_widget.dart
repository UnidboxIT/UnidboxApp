import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/auth_controllers/login_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget loginButtonWidget(LoginController loginController) {
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
          loginController.login();
        },
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: loginController.isLoginLoading
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
