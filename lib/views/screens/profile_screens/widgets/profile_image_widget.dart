import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/profile_controllers/profile_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../bottom_sheets/image_upload_bottom_sheet.dart';

Widget profileImageWidget() {
  return GetBuilder<ProfileController>(builder: (controller) {
    return GestureDetector(
      onTap: () {
        imageUploadBottomSheet();
      },
      child: Column(
        children: [
          controller.isUpdateLoading
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ))
              : controller.imageFile?.path != ""
                  ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      backgroundImage: FileImage(controller.imageFile!),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      backgroundImage: NetworkImage(
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
      ),
    );
  });
}
