import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'dart:math' as math;
import '../../../../../widgets/bottom_sheets/global_bottom_sheet.dart';
import '../../../../../widgets/text_widget.dart';

String base64Image = "";

class CameraWidget extends ConsumerStatefulWidget {
  const CameraWidget({super.key});

  @override
  ConsumerState<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends ConsumerState<CameraWidget> {
  bool isUpdateLoading = false;
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () {
              imageUploadBottomSheet(context);
            },
            child: Container(
              width: 100.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.dropshadowColor,
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ],
              ),
              child: imageFile.path.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.file(
                        imageFile,
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
                // clearSelectedImage();
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

  imageUploadBottomSheet(BuildContext context) {
    return globalBottomSheet(
        Container(
          height: 25.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: const Color(0xffD8EDE5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageIconWidget(() {
                pickImage(ImageSource.gallery, context, ref);
              }, "Upload", Icons.logout),
              imageIconWidget(() {
                pickImage(ImageSource.camera, context, ref);
              }, "Use camera", Icons.camera_enhance),
            ],
          ),
        ),
        context);
  }

  Widget imageIconWidget(
      VoidCallback onPressed, String text, IconData iconData) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      spreadRadius: 5)
                ]),
            child: text == "Upload"
                ? Transform.rotate(
                    angle: -math.pi / 2,
                    child: Icon(
                      iconData,
                      color: AppColor.orangeColor,
                    ),
                  )
                : Icon(
                    iconData,
                    color: AppColor.pinkColor,
                  ),
          ),
          const SizedBox(height: 10),
          textWidget(text, fontWeight: FontWeight.bold)
        ],
      ),
    );
  }

  Future<void> pickImage(ImageSource source, context, WidgetRef ref) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        String image64 = await imageToBase64(imageFile);
        setState(() {
          base64Image = image64;
        });
        Navigator.of(context).pop();
      } else {
        superPrint('No image selected.');
      }
    } catch (e) {
      superPrint('Error picking image: $e');
    }
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}
