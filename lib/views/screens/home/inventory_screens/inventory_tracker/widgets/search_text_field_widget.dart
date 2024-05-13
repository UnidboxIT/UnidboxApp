import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/views/screens/home/inventory_screens/inventory_tracker/scanner/barcode_scanner_screen.dart';

Widget searchTextFieldWidget() {
  return GetBuilder<ProductController>(builder: (controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          textAlign: TextAlign.left,
          controller: controller.txtSearch,
          cursorColor: Colors.grey,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          onChanged: (value) {
            controller.searchProductByText(value);
          },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            suffixIcon: IconButton(
              icon: const Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 18,
              ),
              onPressed: () {
                Get.to(() => const BarCodeScannerScreen());
              },
            ),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              size: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  });
}
