import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/home_controller.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({super.key});

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeController>().calculateTime();
    });
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 12),
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
                admin.name,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                size: 20,
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
