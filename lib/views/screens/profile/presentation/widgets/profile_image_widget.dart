import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/profile/domain/profile.dart';
import 'package:unidbox_app/views/screens/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/views/screens/profile/repository/state/profile_state.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'dart:math' as math;

import '../../../../../utils/commons/super_print.dart';
import '../../../../widgets/bottom_sheets/global_bottom_sheet.dart';

class ProfileImageWidget extends ConsumerStatefulWidget {
  final Profile profileData;

  const ProfileImageWidget({super.key, required this.profileData});

  @override
  ConsumerState<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends ConsumerState<ProfileImageWidget> {
  bool isUpdateLoading = false;
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (pre, next) {
      if (next is ProfileLoading) {
        setState(() {
          isUpdateLoading = true;
        });
      }
      if (next is ProfileData) {
        setState(() {
          isUpdateLoading = false;
        });
      }
    });
    return GestureDetector(
      onTap: () {
        imageUploadBottomSheet(context);
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          isUpdateLoading
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
              : widget.profileData.imageUrl == "false"
                  ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      backgroundImage:
                          AssetImage("assets/images/app_icon.jpeg"),
                    )
                  : imageFile.path != ""
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          backgroundImage: FileImage(imageFile),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          backgroundImage: NetworkImage(
                            widget.profileData.imageUrl,
                          ),
                        ),
          const SizedBox(height: 10),
          textWidget(
            widget.profileData.name,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            size: 18,
          ),
          const SizedBox(height: 8),
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
        base64Image = await imageToBase64(imageFile);
        Navigator.of(context).pop();
        ref
            .read(profileStateNotifierProvider.notifier)
            .imageUpload(base64Image, context);
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
