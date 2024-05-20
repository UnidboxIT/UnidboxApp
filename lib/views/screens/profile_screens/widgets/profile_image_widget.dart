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
        // imageUploadBottomSheet();
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          controller.isUpdateLoading
              ? CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 40,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  ),
                )
              : controller.imageFile.path != ""
                  ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      backgroundImage: FileImage(controller.imageFile),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      backgroundImage: NetworkImage(
                        controller.profile.imageUrl,
                      ),
                    ),
          const SizedBox(height: 10),
          textWidget(
            controller.profile.name,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            size: 18,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  });
}
