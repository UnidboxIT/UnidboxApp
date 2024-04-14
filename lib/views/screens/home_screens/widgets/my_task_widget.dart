import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class MyTaskWidget extends StatelessWidget {
  const MyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "My Task",
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          Container(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
