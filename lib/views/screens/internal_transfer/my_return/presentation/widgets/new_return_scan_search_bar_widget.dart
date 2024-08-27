import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_return/repository/provider/my_return_provider.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/text_widget.dart';
import '../barcode_scanner_screen.dart';

TextEditingController txtSearchController = TextEditingController();

class NewReturnSearchAndScanWidget extends ConsumerStatefulWidget {
  const NewReturnSearchAndScanWidget({super.key});

  @override
  ConsumerState<NewReturnSearchAndScanWidget> createState() =>
      _NewReturnSearchAndScanWidgetState();
}

class _NewReturnSearchAndScanWidgetState
    extends ConsumerState<NewReturnSearchAndScanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        // height: 10.h,
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
        child: TextFormField(
          autofocus: false,
          textAlign: TextAlign.left,
          controller: txtSearchController,
          cursorColor: Colors.grey,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            setState(() {
              txtSearchController.text = value.toString();
            });
          },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            suffixIcon: txtSearchController.text.isNotEmpty
                ? TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      // ref.read(bottomBarVisibilityProvider.notifier).state =
                      //     true;
                      ref
                          .read(myReturnStateNotifierProvider.notifier)
                          .searchProduct(txtSearchController.text, context, 0);
                    },
                    child: textWidget(
                      "Search",
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                      size: 15,
                    ))
                : IconButton(
                    icon: const Icon(
                      CupertinoIcons.qrcode_viewfinder,
                      size: 18,
                    ),
                    onPressed: () {
                      txtSearchController.clear();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const NewReturnBarCodeScannerScreen(),
                      ));
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
