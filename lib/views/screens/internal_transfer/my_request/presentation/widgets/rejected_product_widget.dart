import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

import '../../../../../widgets/text_widget.dart';
import '../../domain/my_request.dart';
import '../reject_request_screen.dart';

Widget rejectedProductWidget(
    List<ProductLineId> rejectedList, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RejectRequestScreen()));
    },
    child: Container(
      width: 47.w,
      padding: const EdgeInsets.only(left: 20),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100.w,
            height: 8.h,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textWidget("Rejected",
                    size: 14,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    color: Colors.white),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Visibility(
            visible: rejectedList.isNotEmpty,
            child: Positioned(
              top: -15,
              right: -10,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColor.pinkColor,
                child: textWidget(
                  "${rejectedList.length}",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
