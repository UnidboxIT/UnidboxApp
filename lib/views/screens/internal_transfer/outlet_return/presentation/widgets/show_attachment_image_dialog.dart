import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';

showAttachmentImageDialog(BuildContext context, String image) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50.h,
                width: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(image),
                  ),
                ),
              ),
              SizedBox(
                width: 50.w,
                child: buttonWidget("Close", () {
                  Navigator.of(context).pop();
                }, bgColor: AppColor.pinkColor, fontColor: Colors.white),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      });
}