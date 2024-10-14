import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/provider/order_receiving_provider.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/state/product_received_remark_state.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../utils/commons/super_print.dart';
import '../../../widgets/bottom_sheets/global_bottom_sheet.dart';
import '../../internal_transfer/my_request/domain/return_request_reason.dart';
import '../domain/order_receiving.dart';
import 'widgets/app_bar_order_detail_widget.dart';

class OrderReceivedDetailScreen extends ConsumerStatefulWidget {
  final int purchaseID;
  final String orderCode;
  final String name;
  final String totalAmount;
  final String creditAmount;
  final String netAmount;
  final String invoiceNo;
  final String deliveryNo;
  final List<OrderReceivingProduct> productList;

  const OrderReceivedDetailScreen(
      {super.key,
      required this.purchaseID,
      required this.orderCode,
      required this.name,
      required this.totalAmount,
      required this.productList,
      required this.creditAmount,
      required this.invoiceNo,
      required this.deliveryNo,
      required this.netAmount});

  @override
  ConsumerState<OrderReceivedDetailScreen> createState() =>
      _OrderReceivedDetailScreenState();
}

class _OrderReceivedDetailScreenState
    extends ConsumerState<OrderReceivedDetailScreen> {
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
  List<ReturnRequestReason> productRemarkList = [];
  Map<String, dynamic> productRemarkMap = {};

  List receivedLine = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(productReceivedRemarkStateNotifierProvider.notifier)
          .getProductReceivedRemark();
    });
    receivedLine.clear();
    for (var data in widget.productList) {
      receivedLine.add({
        "id": data.id,
        "product_id": data.products,
        "quantity": data.quantity
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(productReceivedRemarkStateNotifierProvider, (pre, next) {
      if (next is ProductReceivedRemarkList) {
        setState(() {
          productRemarkList = next.productReceivedRemarkList;
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
              orderDetailAppBarWidget(widget.orderCode, widget.name, () {
                Navigator.of(context).pop();
              }),
              Transform.translate(
                offset: Offset(0, 15.5.h),
                child: orderDetailWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetailWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 5),
          invoiceAndDoNumberWidget(
              "Invoice Number".toUpperCase(),
              widget.invoiceNo == "false" ? "" : widget.invoiceNo,
              Icons.edit_document,
              () {}),
          const SizedBox(height: 20),
          invoiceAndDoNumberWidget(
              "DO Number".toUpperCase(),
              widget.deliveryNo == "false" ? "" : widget.deliveryNo,
              Icons.handyman_rounded,
              () {}),
          productServiceWidget(),
          productReceivedListViewWidget(),
          const SizedBox(height: 20),
          amountWidget("Total Amount", widget.totalAmount,
              CupertinoIcons.money_dollar_circle),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              amountWidget("Credit Amount", widget.creditAmount,
                  Icons.money_off_csred_outlined),
              amountWidget(
                  "Net Amount", widget.netAmount, Icons.payment_outlined),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 40.w,
            child: buttonWidget(
              "OK",
              () {
                ref
                    .read(pendingOrderReceivingStateNotifierProvider.notifier)
                    .receiveByID(widget.purchaseID, receivedLine);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget productServiceWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.design_services_sharp,
          color: AppColor.primary,
          size: 19,
        ),
        const SizedBox(width: 15),
        textWidget(
          "Product Received".toUpperCase(),
          color: AppColor.pinkColor,
          size: 14,
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            imageUploadBottomSheet(context);
          },
          icon: Icon(
            CupertinoIcons.add_circled_solid,
            color: AppColor.orangeColor,
          ),
        ),
      ],
    );
  }

  Widget productReceivedListViewWidget() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 43.w,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget(widget.productList[index].defaultCode),
                          const Icon(CupertinoIcons.qrcode_viewfinder)
                        ],
                      ),
                    ),
                    Container(
                      width: 15.w,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: textWidget(
                          widget.productList[index].quantity.toString()),
                    ),
                    Container(
                      width: 25.w,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: textWidget(
                          "\$ ${widget.productList[index].price.toStringAsFixed(2)}"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                selectedRemarkDropDownWidget(index),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: widget.productList.length);
  }

  Widget invoiceAndDoNumberWidget(String title, String numberText,
      IconData iconData, VoidCallback onPressed) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconData,
          color: AppColor.primary,
          size: 19,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              title,
              color: AppColor.pinkColor,
              size: 14,
              fontWeight: FontWeight.w700,
            ),
            textWidget(
              numberText,
              size: 14,
              color: Colors.black,
            ),
          ],
        ),
        const Spacer(),
        Transform.rotate(
          angle: 90 * math.pi / 180,
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

  Widget selectedRemarkDropDownWidget(int index) {
    return Container(
      width: 100.w,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      alignment: Alignment.center,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
            isExpanded: true,
            autofocus: true,
            isDense: true,
            dropdownStyleData: DropdownStyleData(
              width: 80.w,
              offset: const Offset(-10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ),
            hint: Text(
              'Select Remark',
              style: TextStyle(
                  fontSize: 13,
                  color: AppColor.fontColor.withOpacity(0.6),
                  fontWeight: FontWeight.w500),
            ),
            items: productRemarkList
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.reason,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ))
                .toList(),
            value: productRemarkMap[widget.productList[index].products[0]],
            onChanged: (values) {
              ref
                  .read(productReceivedRemarkStateNotifierProvider.notifier)
                  .addOrderFormReason(widget.productList[index].products[0],
                      values!, productRemarkMap);
            }),
      ),
    );
  }

  Widget amountWidget(String title, String price, IconData iconData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconData,
          color: AppColor.primary,
          size: 19,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              title.toUpperCase(),
              color: AppColor.pinkColor,
              size: 13,
              fontWeight: FontWeight.w700,
            ),
            textWidget("\$ $price")
          ],
        ),
      ],
    );
  }
}
