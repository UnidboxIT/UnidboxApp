import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controller.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeController>().calculateTime();
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<HomeController>(builder: (controller) {
                return textWidget(
                  controller.timeText,
                  fontWeight: FontWeight.w700,
                  size: 14,
                  color: Colors.black.withOpacity(0.6),
                );
              }),
              textWidget(
                "Ah Tan",
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.8),
                size: 18,
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 10.w,
            height: 50,
            alignment: Alignment.centerRight,
            color: Colors.transparent,
            child: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              color: Colors.redAccent,
            ),
          ),
          Container(
            width: 10.w,
            height: 50,
            color: Colors.transparent,
            alignment: Alignment.centerRight,
            child: const Icon(
              CupertinoIcons.bell,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
