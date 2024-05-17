import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/auth/repository/auth_state_notifier.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget rememberMeWidget(WidgetRef ref) {
  final isCheck =
      ref.watch(authStateNotifierControllerProvider.notifier).isSelected;
  return GestureDetector(
    onTap: () {
      ref
          .read(authStateNotifierControllerProvider.notifier)
          .selectedCheckBox(true);
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
            isCheck ? Icons.check_box_rounded : Icons.check_box_outline_blank,
            color: Colors.grey.shade400,
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
