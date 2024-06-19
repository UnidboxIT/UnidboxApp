import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';

import '../repository/state/my_request_state.dart';

class ReceiveScanScreen extends ConsumerStatefulWidget {
  final int productID;
  final int qty;
  final String productName;
  const ReceiveScanScreen(
      {super.key,
      required this.productID,
      required this.qty,
      required this.productName});

  @override
  _BarcodeScannerWithOverlayState createState() =>
      _BarcodeScannerWithOverlayState();
}

class _BarcodeScannerWithOverlayState extends ConsumerState<ReceiveScanScreen> {
  File imageFile = File("");
  final picker = ImagePicker();
  String base64Image = "";
  bool requestLoading = false;
  @override
  void initState() {
    super.initState();
    getImageFromCamera();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      String image64 = await imageToBase64(imageFile);
      setState(() {
        base64Image = image64;
      });
    }
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  @override
  Widget build(BuildContext context) {
    // superPrint(widget.qty);
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestLoading) {
        setState(() {
          requestLoading = true;
        });
      }

      if (next is MyRequestList) {
        setState(() {
          requestLoading = false;
        });
      }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Inventory Transfer",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                  offset: Offset(0, 15.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: 100.w,
                      height: 60.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: imageFile.path.isEmpty
                            ? Image.asset(
                                "assets/images/app_icon.jpeg",
                                fit: BoxFit.contain,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: FileImage(
                                        imageFile,
                                      ),
                                      fit: BoxFit.contain,
                                    )),
                              ),
                      ),
                    ),
                  )),
              Positioned(
                bottom: 10.h,
                left: 8.w,
                right: 8.w,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(myRequestStateNotifierProvider.notifier)
                        .receivedByImageMyRequest(
                            widget.productID, widget.qty, context, base64Image);
                  },
                  child: Container(
                    height: 40,
                    width: 60.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: requestLoading
                        ? const Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Items Received",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
