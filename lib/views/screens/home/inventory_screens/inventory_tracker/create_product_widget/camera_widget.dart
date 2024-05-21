import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

Widget cameraWidget(ProductController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () {
            // productImageUploadBottomSheet();
          },
          child: Container(
            width: 100.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: AppColor.dropshadowColor,
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ],
            ),
            child: controller.imageFile.path.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.file(
                      controller.imageFile,
                      fit: BoxFit.fill,
                    ),
                  )
                : const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.grey,
                    size: 35,
                  ),
          ),
        ),
        IconButton(
            onPressed: () {
              controller.clearSelectedImage();
              superPrint("Icon Button");
            },
            icon: const Icon(
              CupertinoIcons.delete,
              size: 18,
            ))
      ],
    ),
  );
}
