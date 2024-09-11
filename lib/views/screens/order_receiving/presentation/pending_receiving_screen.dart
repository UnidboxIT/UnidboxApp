import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class PendingReceivingScreen extends StatefulWidget {
  const PendingReceivingScreen({super.key});

  @override
  State<PendingReceivingScreen> createState() => _PendingReceivingScreenState();
}

class _PendingReceivingScreenState extends State<PendingReceivingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.bottomSheetBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      const SizedBox(height: 10),
                      invoiceNumberOrderWidget(),
                      const SizedBox(height: 10),
                      doNumberOrderWidget(),
                    ],
                  ),
                ),
                Container(
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColor.bottomSheetBgColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: 10);
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
            Expanded(
                flex: 4, child: textWidget("Invoice Number :", size: 13.5)),
            Expanded(flex: 6, child: eachTextFieldWidget()),
            Expanded(
              flex: 2,
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: IconButton(
                  onPressed: () {},
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
                child:
                    textWidget("Total Amount :\n(GST Excluded)", size: 13.5)),
            Expanded(flex: 6, child: eachTextFieldWidget()),
            Expanded(flex: 2, child: SizedBox.fromSize())
          ],
        ))
      ],
    );
  }

  Widget eachTextFieldWidget() {
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
        Expanded(flex: 4, child: textWidget("DO Number :", size: 13.5)),
        Expanded(flex: 6, child: eachTextFieldWidget()),
        Expanded(
          flex: 2,
          child: Transform.rotate(
            angle: 90 * pi / 180,
            child: IconButton(
              onPressed: () {},
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
}
