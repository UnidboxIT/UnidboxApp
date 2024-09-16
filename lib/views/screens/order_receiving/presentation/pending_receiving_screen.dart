import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../utils/commons/super_print.dart';
import '../../../widgets/bottom_sheets/global_bottom_sheet.dart';
import '../domain/order_receiving.dart';
import 'order_received_detail_screen.dart';
import 'widgets/receiving_product_line_widget.dart';
import 'dart:math' as math;
import 'widgets/shimmer_order_receiving_widget.dart';

class PendingReceivingScreen extends ConsumerStatefulWidget {
  final bool isPendingLoading;
  final List<OrderReceiving> pendingOrderReceivingList;
  const PendingReceivingScreen(
      {super.key,
      required this.isPendingLoading,
      required this.pendingOrderReceivingList});

  @override
  ConsumerState<PendingReceivingScreen> createState() =>
      _PendingReceivingScreenState();
}

class _PendingReceivingScreenState
    extends ConsumerState<PendingReceivingScreen> {
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
  TextEditingController txtInvoiceNumber = TextEditingController();
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDoNumber = TextEditingController();
  List<int> visiblityIndex = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPendingLoading
        ? shimmerOrderReceivingWidget()
        : ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemBuilder: (context, index) {
              return !visiblityIndex.contains(index)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          visiblityIndex.add(index);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 3,
                                  spreadRadius: 3)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            eachOrderNoWidget("P02/23/00012", "22 Oct 2023"),
                            const SizedBox(height: 10),
                            textWidget(
                              "Amax Machinery Pte Ltd",
                              color: AppColor.orangeColor,
                              fontWeight: FontWeight.w600,
                              size: 14,
                            ),
                            const SizedBox(height: 5),
                            eachOrderAmountWidget("\$128.50"),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          visiblityIndex.remove(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.bottomSheetBgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  eachOrderNoWidget(
                                      "P02/23/00012", "22 Oct 2023"),
                                  const SizedBox(height: 10),
                                  textWidget(
                                    widget.pendingOrderReceivingList[index]
                                        .orderProduct[1],
                                    color: AppColor.orangeColor,
                                    fontWeight: FontWeight.w600,
                                    size: 14,
                                  ),
                                  const SizedBox(height: 5),
                                  eachOrderAmountWidget("\$128.50"),
                                  const SizedBox(height: 10),
                                  invoiceNumberOrderWidget(),
                                  const SizedBox(height: 10),
                                  doNumberOrderWidget(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.bottomSheetBgColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, productIndex) {
                                    String imageUrl = "";
                                    String name = widget
                                        .pendingOrderReceivingList[index]
                                        .productList[productIndex]
                                        .products[1];
                                    String defaultCode = widget
                                        .pendingOrderReceivingList[index]
                                        .productList[productIndex]
                                        .defaultCode;
                                    String price = widget
                                        .pendingOrderReceivingList[index]
                                        .productList[productIndex]
                                        .price
                                        .toStringAsFixed(2);
                                    String qty = "1";
                                    return receivingProductLineWidget(imageUrl,
                                        name, defaultCode, price, qty);
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 15);
                                  },
                                  itemCount: widget
                                      .pendingOrderReceivingList[index]
                                      .productList
                                      .length),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                                width: 85.w,
                                child: buttonWidget(
                                  "Delivery Received",
                                  () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OrderReceivedDetailScreen(
                                                orderCode: "P02/23/00012",
                                                name: widget
                                                    .pendingOrderReceivingList[
                                                        index]
                                                    .orderProduct[1],
                                                productList: widget
                                                    .pendingOrderReceivingList[
                                                        index]
                                                    .productList),
                                      ),
                                    );
                                  },
                                  elevation: 0,
                                )),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: widget.pendingOrderReceivingList.length);
  }

  Widget eachOrderNoWidget(String orderCode, String date) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              orderCode,
              color: AppColor.pinkColor,
              fontWeight: FontWeight.w700,
              size: 15,
            ),
            textWidget(date, size: 12)
          ],
        ),
        Icon(
          Icons.edit_document,
          color: AppColor.orangeColor,
        ),
      ],
    );
  }

  Widget eachOrderAmountWidget(String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget("Total amount(GST Excluded) :", size: 13.5),
        textWidget(price, size: 13.5),
      ],
    );
  }

  Widget invoiceNumberOrderWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 4, child: textWidget("Invoice Number :", size: 13)),
            Expanded(flex: 6, child: eachTextFieldWidget(txtInvoiceNumber)),
            Expanded(
              flex: 2,
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: IconButton(
                  onPressed: () {
                    imageUploadBottomSheet(context);
                  },
                  icon: Icon(
                    Icons.attach_file_rounded,
                    color: AppColor.orangeColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Visibility(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget("Total Amount :", size: 13),
                    textWidget("(GST Excluded)", size: 11)
                  ],
                )),
            Expanded(flex: 6, child: eachTextFieldWidget(txtAmount)),
            Expanded(flex: 2, child: SizedBox.fromSize())
          ],
        ))
      ],
    );
  }

  Widget eachTextFieldWidget(TextEditingController txtController) {
    return Container(
      height: 42,
      width: 42.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: txtController,
        cursorColor: AppColor.orangeColor,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget doNumberOrderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 4, child: textWidget("DO Number :", size: 13)),
        Expanded(flex: 6, child: eachTextFieldWidget(txtDoNumber)),
        Expanded(
          flex: 2,
          child: Transform.rotate(
            angle: 90 * pi / 180,
            child: IconButton(
              onPressed: () {
                imageUploadBottomSheet(context);
              },
              icon: Icon(
                Icons.attach_file_rounded,
                color: AppColor.orangeColor,
              ),
            ),
          ),
        )
      ],
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
