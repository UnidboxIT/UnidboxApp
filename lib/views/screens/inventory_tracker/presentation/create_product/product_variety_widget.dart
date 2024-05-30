import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/create_product/each_text_field_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/product_variety_state.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../repository/provider/create_product_provider.dart';
import 'show_uom_dialog.dart';

TextEditingController txtVarietyFactor = TextEditingController();
TextEditingController txtVarietyBarCode = TextEditingController();
TextEditingController txtVarietyPrice = TextEditingController();
String uomName = "";
Map<int, dynamic> varietyValueMap = {};
int productVarietyIncrement = 1;

class ProductVarietyWidget extends ConsumerStatefulWidget {
  const ProductVarietyWidget({super.key});

  @override
  ConsumerState<ProductVarietyWidget> createState() =>
      _ProductVarietyWidgetState();
}

class _ProductVarietyWidgetState extends ConsumerState<ProductVarietyWidget> {
  List varietyIncrementValueList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtVarietyBarCode.clear();
    txtVarietyFactor.clear();
    txtVarietyPrice.clear();
    ref
        .read(productVariteyStateNotifierProvider.notifier)
        .clearProductVarietyMap();
    productVarietyIncrement = 1;
    varietyIncrementValueList.add(1);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(productVariteyStateNotifierProvider, (pre, next) {
      if (next is ProductVarietyValueMap) {
        setState(() {
          varietyValueMap = next.varietyValueMap;
        });
      }
      if (next is IncrementProductVariety) {
        setState(() {
          productVarietyIncrement = next.qty;
          varietyIncrementValueList.add(next.qty);
        });
      }
      if (next is DecrementProductVariety) {
        setState(() {
          varietyIncrementValueList.remove(next.removeId);
        });
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textWidget("Product Variety",
                  color: AppColor.primary, size: 15),
            ),
            GestureDetector(
              onTap: () {
                if (txtVarietyBarCode.text.isNotEmpty &&
                    txtVarietyFactor.text.isNotEmpty &&
                    txtVarietyPrice.text.isNotEmpty) {
                  ref
                      .read(productVariteyStateNotifierProvider.notifier)
                      .incrementProductVariety(
                          productVarietyIncrement,
                          txtVarietyBarCode.text,
                          txtVarietyFactor.text,
                          txtVarietyPrice.text)
                      .then((_) {
                    txtVarietyBarCode.clear();
                    txtVarietyFactor.clear();
                    txtVarietyPrice.clear();
                  });
                } else {
                  CommonMethods.customizedAlertDialog(
                      "Please fill all", context);
                }
              },
              child: Container(
                width: 150,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.add_circle_rounded,
                  color: AppColor.orangeColor,
                ),
              ),
            )
          ],
        ),
        eachProductVarietyWidget(),
      ],
    );
  }

  Widget eachProductVarietyWidget() {
    superPrint(varietyIncrementValueList);
    return Column(
        children: varietyIncrementValueList.map((e) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: textWidget(
                  "Variety  $e:",
                  color: Colors.black.withOpacity(0.6),
                  size: 14,
                ),
              ),
              varietyIncrementValueList.length == 1
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        ref
                            .read(productVariteyStateNotifierProvider.notifier)
                            .decrementProductVariety(e);
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.transparent,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.remove_circle_outline_sharp,
                          color: AppColor.pinkColor,
                        ),
                      ),
                    )
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showUomDialog();
                  },
                  child: SizedBox(
                    width: 42.w,
                    child: eachUomTextWidget(
                      "Uom",
                      uomName,
                    ),
                  ),
                ),
                SizedBox(
                  width: 42.w,
                  child: varietyValueMap[e] != null
                      ? eachProductVarietyTextFieldWidget(
                          "Factor", varietyValueMap[e]['factor'].toString())
                      : eachTextFieldWidget(
                          "Factor", txtVarietyFactor, "Factor",
                          horizontal: 0, isNumber: true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 42.w,
                  child: varietyValueMap[e] != null
                      ? eachProductVarietyTextFieldWidget(
                          "Price", varietyValueMap[e]['price'].toString())
                      : eachTextFieldWidget("Price", txtVarietyPrice, "Price",
                          horizontal: 0, isNumber: true),
                ),
                SizedBox(
                  width: 42.w,
                  child: varietyValueMap[e] != null
                      ? eachProductVarietyTextFieldWidget(
                          "Barcode", varietyValueMap[e]['barcode'])
                      : eachTextFieldWidget(
                          "Barcode",
                          txtVarietyBarCode,
                          "Barcode",
                          horizontal: 0,
                        ),
                ),
              ],
            ),
          ),
        ],
      );
    }).toList());
  }
}
