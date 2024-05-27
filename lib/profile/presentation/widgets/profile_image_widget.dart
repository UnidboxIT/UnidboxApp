import 'package:flutter/material.dart';
import 'package:unidbox_app/profile/domain/profile.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget profileImageWidget(Profile profile) {
  return GestureDetector(
    onTap: () {
      // imageUploadBottomSheet();
    },
    child: Column(
      children: [
        const SizedBox(height: 10),
        // isUpdateLoading
        //     ? CircleAvatar(
        //         backgroundColor: Colors.grey.shade200,
        //         radius: 40,
        //         child: SizedBox(
        //           width: 20,
        //           height: 20,
        //           child: CircularProgressIndicator(
        //             color: AppColor.primary,
        //           ),
        //         ),
        //       )
        //     : imageFile.path != ""
        //         ? CircleAvatar(
        //             backgroundColor: Colors.white,
        //             radius: 40,
        //             backgroundImage: FileImage(imageFile),
        //           )
        //         :
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 40,
          backgroundImage: NetworkImage(
            profile.imageUrl,
          ),
        ),
        const SizedBox(height: 10),
        textWidget(
          profile.name,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          size: 18,
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}
