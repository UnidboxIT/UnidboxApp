import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import '../../../../utils/commons/super_print.dart';
import '../../../../utils/constant/app_color.dart';

class CameraOrderReceivingScreen extends ConsumerStatefulWidget {
  const CameraOrderReceivingScreen({super.key});

  @override
  ConsumerState<CameraOrderReceivingScreen> createState() =>
      _CameraOrderReceivingScreenState();
}

class _CameraOrderReceivingScreenState
    extends ConsumerState<CameraOrderReceivingScreen> {
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            pickImage(ImageSource.camera, context, ref);
          },
          child: Container(
            width: 100.w,
            height: 80.h,
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
      ),
    );
  }

  Future<void> pickImage(ImageSource source, context, WidgetRef ref) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        base64Image = await imageToBase64(imageFile);
        Navigator.of(context).pop();
        // ref
        //     .read(profileStateNotifierProvider.notifier)
        //     .imageUpload(base64Image, context);
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
