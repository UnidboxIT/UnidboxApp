import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerMyReturnHistoryWidget() {
  return ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.only(bottom: 20),
    physics: const ClampingScrollPhysics(),
    itemBuilder: (context, index) {
      return Container(
        width: 100.w, //  height: 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: Container(
                width: 100.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              top: 3.h,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  width: 90.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 15,
            //   child: Shimmer.fromColors(
            //     baseColor: Colors.grey.shade300,
            //     highlightColor: Colors.white,
            //     child: Container(
            //       width: 33.w,
            //       height: 4.h,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    },
    itemCount: 4,
    separatorBuilder: (context, index) {
      return const SizedBox(height: 20);
    },
  );
}
