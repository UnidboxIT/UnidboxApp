import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/create_product/widget/each_text_field_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/product_variety_state.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../domain/multi_uom.dart';
import '../../../repository/provider/create_product_provider.dart';
import '../create_product_screen.dart';
import 'show_uom_dialog.dart';

TextEditingController txtVarietyFactor = TextEditingController();
TextEditingController txtVarietyBarCode = TextEditingController();
TextEditingController txtVarietyPrice = TextEditingController();
Map<int, dynamic> varietyValueMap = {};
List<Map<String, dynamic>> varietyValueMapList = [];
int productVarietyIncrement = 1;
MultiUom selectedUom = MultiUom(value: "", name: '');

class ProductVarietyWidget extends ConsumerStatefulWidget {
  const ProductVarietyWidget({super.key});

  @override
  ConsumerState<ProductVarietyWidget> createState() =>
      _ProductVarietyWidgetState();
}

class _ProductVarietyWidgetState extends ConsumerState<ProductVarietyWidget> {
  @override
  void initState() {
    super.initState();
    // ref
    //     .read(productVariteyStateNotifierProvider.notifier)
    //     .clearProductVarietyMap();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(uomStateNotifierProvider.notifier).getMultiUom();
    });
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
              child: textWidget(
                "Multi UOM",
                color: AppColor.primary,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
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
                          selectedUom.value,
                          int.parse(txtVarietyFactor.text),
                          int.parse(txtVarietyPrice.text))
                      .then((_) {
                    Future.delayed(const Duration(milliseconds: 10), () {
                      ref.read(uomStateNotifierProvider.notifier).getMultiUom();
                    });
                    selectedUom = MultiUom(value: "", name: '');
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
                height: 40,
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
                SizedBox(
                    width: 42.w,
                    child: varietyValueMap[e] != null
                        ? eachProductVarietyTextFieldWidget(
                            "Uom", varietyValueMap[e]['uom_option'].toString())
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(
                                  "Uom",
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.pinkColor,
                                ),
                                const SizedBox(height: 5),
                                const UomDropDownDialog()
                              ],
                            ),
                          )),
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