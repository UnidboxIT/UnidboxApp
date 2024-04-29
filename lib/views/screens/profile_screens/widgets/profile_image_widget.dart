import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/profile_controllers/profile_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget profileImageWidget() {
  return GetBuilder<ProfileController>(builder: (controller) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          backgroundImage: CachedNetworkImageProvider(
            controller.profile.imageUrl,
          ),
        ),
        const SizedBox(height: 10),
        textWidget(
          controller.profile.name,
          color: AppColor.fontColor,
          fontWeight: FontWeight.w600,
          size: 16,
        )
      ],
    );
  });
}
