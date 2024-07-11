import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../barcode_scanner/barcode_scanner_screen.dart';
import '../search_product/search_product_screen.dart';

class SearchTextFieldWidget extends ConsumerStatefulWidget {
  final bool isInventoryTracker;
  final bool isAutoFocus;
  final String name;
  const SearchTextFieldWidget(
      {super.key,
      required this.isInventoryTracker,
      required this.isAutoFocus,
      required this.name});

  @override
  ConsumerState<SearchTextFieldWidget> createState() =>
      _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends ConsumerState<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        // height: 50,
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
          autofocus: false,
          textAlign: TextAlign.left,
          // controller: txtSearchProduct,
          cursorColor: Colors.grey,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
            ref.read(bottomBarVisibilityProvider.notifier).state = true;
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => SearchProductScreen(
                  name: widget.name,
                ),
              ),
            )
                .then((_) {
              txtSearchProduct.clear();
              FocusManager.instance.primaryFocus!.unfocus();
            });
          },
          // onChanged: (value) {
          //   if (value.isNotEmpty) {
          //     Navigator.of(context).pop();
          //     Navigator.of(context)
          //         .push(
          //       MaterialPageRoute(
          //         builder: (context) => SearchProductScreen(
          //           name: widget.name,
          //         ),
          //       ),
          //     )
          //         .then((_) {
          //       txtSearchProduct.clear();
          //       FocusManager.instance.primaryFocus!.unfocus();
          //     });
          //   }
          //   superPrint(value);
          // },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            suffixIcon: IconButton(
              icon: const Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 18,
              ),
              onPressed: () {
                txtSearchProduct.clear();
                ref.read(bottomBarVisibilityProvider.notifier).state = false;
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (_) => const BarCodeScannerScreen()))
                    .then((_) {
                  //Navigator.of(context).pop();
                });
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
}
