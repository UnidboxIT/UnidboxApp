import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class OngoingJobWidget extends StatelessWidget {
  const OngoingJobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "Ongoing Job",
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return eachOngoingJobWidget();
            },
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget eachOngoingJobWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -3.h,
            right: -3.w,
            child: Container(
              width: 65,
              height: 51,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]),
            ),
          ),
          Positioned(
            top: -5.h,
            right: -6.w,
            child: Lottie.asset(
              "assets/lottie/delivery.json",
              width: 80,
              height: 80,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                "Yu Teik Luk",
                color: Colors.redAccent,
                size: 14,
                fontWeight: FontWeight.w700,
              ),
              textWidget(
                "Delivery",
                color: Colors.amber,
                fontWeight: FontWeight.w700,
                size: 14,
              ),
              const Spacer(),
              textWidget("Blk 123A Houngang North #14-532 S(232 123)", size: 12)
            ],
          ),
        ],
      ),
    );
  }
}
