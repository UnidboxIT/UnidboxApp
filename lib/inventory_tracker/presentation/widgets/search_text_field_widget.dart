import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/inventory_tracker/presentation/barcode_scanner/barcode_scanner_screen.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../search_product/search_product_screen.dart';

Widget searchTextFieldWidget(BuildContext context, WidgetRef ref,
    {bool isInventoryTracker = false,
    bool isAutoFocus = false,
    String name = ""}) {
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
        autofocus: isAutoFocus,
        textAlign: TextAlign.left,
        controller: txtSearchProduct,
        cursorColor: Colors.grey,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        onTap: () {
          if (isInventoryTracker) {
            FocusManager.instance.primaryFocus!.unfocus();
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => SearchProductScreen(name: name),
              ),
            )
                .then((_) {
              FocusManager.instance.primaryFocus!.unfocus();
            });
          }
        },
        onChanged: (value) {
          superPrint(value);
          if (!isInventoryTracker) {
            ref
                .read(productStateNotifierProvider.notifier)
                .searchProduct(value, context, "0");
          }
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const BarCodeScannerScreen()));
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
}
