import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';
import '../../../internal_transfer/my_request/presentation/widgets/each_product_line_widget.dart';
import '../../domain/product.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../../repository/state/inhouse_stock_state.dart';

// bool isUrgent = false;
int selectedBox = 0;
Map<String, int> qtyByMap = {};
Map<String, bool> isUrgentMap = {};

class EachProductListRequestWidget extends ConsumerStatefulWidget {
  final Products product;
  final List<String> productIdList;
  const EachProductListRequestWidget(
      {super.key, required this.product, required this.productIdList});

  @override
  ConsumerState<EachProductListRequestWidget> createState() =>
      _EachProductListRequestWidgetState();
}

class _EachProductListRequestWidgetState
    extends ConsumerState<EachProductListRequestWidget> {
  TextEditingController txtTotalQty = TextEditingController();
  int totalQty = 1;
  bool isShowTextField = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var data in widget.productIdList) {
      qtyByMap.update(data, (value) => value, ifAbsent: () => 1);
    }
    selectedBox =
        widget.product.uomList.isNotEmpty ? widget.product.uomList[0] : 0;
    superPrint(qtyByMap);
  }

  @override
  Widget build(BuildContext context) {
    String productId = widget.product.id.toString();
    String fullName = widget.product.fullName;
    double qty = widget.product.quantity;
    double price = widget.product.price;
    double qtyOutStock = widget.product.qtyOutStock;

    ref.listen(inhouseStockStateNotifierProvider, (pre, state) {
      if (state is SelectedBoxType) {
        setState(() {
          selectedBox = state.uomIndex;
        });
      }
      if (state is DefaultWarehouseIncrementQty &&
          state.productID == productId) {
        setState(() {
          totalQty = state.qty;
          qtyByMap.addAll({productId: totalQty});
          txtTotalQty.text = qtyByMap[productId]!.toString();
        });
      }
      if (state is DefaultWarehouseDecrementQty &&
          state.productID == productId) {
        setState(() {
          totalQty = state.qty;
          qtyByMap.addAll({productId: totalQty});
          txtTotalQty.text = qtyByMap[productId]!.toString();
        });
      }

      if (state is DefaultWarehouseTextFieldValue &&
          state.productID == productId) {
        totalQty = state.qty;
        qtyByMap.addAll({productId: totalQty});
        txtTotalQty.text = qtyByMap[productId]!.toString();
      }
      if (state is SelectedWarehouseUrgent && state.productID == productId) {
        setState(() {
          isUrgentMap.addAll({productId: state.selectedUrgent});
        });
      }
      if (state is UnselectedWarehouseUrgent && state.productID == productId) {
        setState(() {
          isUrgentMap.addAll({productId: state.selectedUrgent});
        });
      }
      // if (state is Urgent) {
      //   setState(() {
      //     isUrgent = state.selectedUrgent;
      //   });
      // }
    });

    superPrint(qtyByMap);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 3.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: qty > qtyOutStock ? AppColor.orangeColor : Colors.red,
          ),
          alignment: Alignment.center,
          child: textWidget(
              qty > qtyOutStock ? "Sufficient Stock" : "Insufficient Stock",
              color: Colors.white,
              size: 12.5,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: textWidget(fullName,
              maxLine: 3,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              size: 13,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget("Qty : ${qty.toInt()}",
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  size: 12,
                  fontWeight: FontWeight.w500),
              textWidget("\$ ${CommonMethods.twoDecimalPrice(price)}",
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  size: 12,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addMinusIconButtonWidget(
              () {
                superPrint(productId);
                ref
                    .read(inhouseStockStateNotifierProvider.notifier)
                    .defaultWarehouseDecrementQty(productId, totalQty);
              },
              CupertinoIcons.minus_circle_fill,
              AppColor.primary,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowTextField = !isShowTextField;
                  if (isShowTextField) {
                    txtTotalQty.text = qtyByMap[productId].toString();
                  }
                });
              },
              child: isShowTextField
                  ? Container(
                      height: 38,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.dropshadowColor,
                                blurRadius: 3,
                                spreadRadius: 3),
                          ]),
                      child: TextFormField(
                        controller: txtTotalQty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        cursorColor: AppColor.primary,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            txtTotalQty.text = value;
                            ref
                                .read(
                                    inhouseStockStateNotifierProvider.notifier)
                                .defaultWarehouseTextFieldValue(
                                    productId, int.parse(txtTotalQty.text));
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                    )
                  : Container(
                      height: 38,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.dropshadowColor,
                                blurRadius: 3,
                                spreadRadius: 3),
                          ]),
                      alignment: Alignment.center,
                      child: textWidget(
                        qtyByMap[productId].toString(),
                        size: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            addMinusIconButtonWidget(
              () {
                ref
                    .read(inhouseStockStateNotifierProvider.notifier)
                    .defaultWarehouseIncrementQty(productId, totalQty);
              },
              CupertinoIcons.add_circled_solid,
              AppColor.primary,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ref
                      .read(inhouseStockStateNotifierProvider.notifier)
                      .selectedRequestBox(widget.product.uomList[0]);
                },
                child: boxPieceWidget(
                    widget.product.uomList[1], widget.product.uomList[0]),
              ),
              const SizedBox(width: 10),
              Container(
                color: Colors.transparent,
                height: 30,
                alignment: Alignment.center,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            ref
                                .read(
                                    inhouseStockStateNotifierProvider.notifier)
                                .selectedRequestBox(
                                    widget.product.multiUomList[index][0]);
                          },
                          child: boxPieceWidget(
                              widget.product.multiUomList[index][1],
                              widget.product.multiUomList[index][0]));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: widget.product.multiUomList.length),
              ),
            ],
          ),
        ]),
        const SizedBox(height: 10),
        urgentWidget(widget.product.id.toString()),
      ],
    );
  }

  Widget boxPieceWidget(String name, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: index == selectedBox ? AppColor.pinkColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColor.dropshadowColor,
                blurRadius: 3,
                spreadRadius: 3),
          ]),
      child: textWidget(
        name,
        fontWeight: FontWeight.bold,
        color: index == selectedBox ? Colors.white : Colors.black,
        size: 15,
      ),
    );
  }

  Widget urgentWidget(String productID) {
    return GestureDetector(
      onTap: () {
        if (isUrgentMap[productID] == true) {
          ref
              .read(inhouseStockStateNotifierProvider.notifier)
              .unselectedWarehouseUrgent(productID, false);
        } else {
          ref
              .read(inhouseStockStateNotifierProvider.notifier)
              .selectedWarehouseUrgent(productID, true);
        }
      },
      child: Container(
        width: 30.w,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              isUrgentMap[productID] == true
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_outlined,
              size: 18,
            ),
            const SizedBox(width: 10),
            textWidget("Urgent", size: 12, fontWeight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
