import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/login_controller.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget rememberMeWidget(LoginController loginController) {
  return GestureDetector(
    onTap: () {
      loginController.clickRememberMe();
    },
    child: Container(
      width: 50.w,
      height: 40,
      color: Colors.transparent,
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            loginController.isRememberMe
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: loginController.isRememberMe
                ? Colors.green
                : Colors.grey.shade400,
            size: 20,
          ),
          const SizedBox(width: 10),
          textWidget(
            "Remember Me",
            fontWeight: FontWeight.w600,
            size: 13,
          ),
        ],
      ),
    ),
  );
}
