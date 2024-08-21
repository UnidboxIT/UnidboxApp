import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../my_request/domain/return_request_reason.dart';
import '../../../my_request/presentation/return_request_screen.dart';
import '../../../my_request/repository/provider/my_request_provider.dart';
import '../../../my_request/repository/state/return_request_state.dart';
import 'each_my_return_product_widget.dart';

TextEditingController txtNewReturnComment = TextEditingController();
int sumNewReturnQty = 0;

class MakeNewReturnReasonWidget extends ConsumerStatefulWidget {
  final String reasonIndex;
  final List<String> reasonIndexList;
  final List<ReturnRequestReason> returnRequestReasonList;
  final double receiveQty;
  const MakeNewReturnReasonWidget(
      {super.key,
      required this.reasonIndex,
      required this.reasonIndexList,
      required this.returnRequestReasonList,
      required this.receiveQty});

  @override
  ConsumerState<MakeNewReturnReasonWidget> createState() =>
      _EachReturnReasonWidgetState();
}

class _EachReturnReasonWidgetState
    extends ConsumerState<MakeNewReturnReasonWidget> {
  TextEditingController txtQty = TextEditingController();
  bool isShowTextField = false;
  int totalQty = 1;
  bool requestLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtNewReturnComment.clear();
    for (var data in widget.reasonIndexList) {
      reasonQtyMap.update(data, (value) => value, ifAbsent: () => 1);
      sumNewReturnQty = reasonQtyMap.values
          .fold(0, (previousValue, element) => previousValue + element);
    }
    superPrint(sumNewReturnQty);
    superPrint(reasonQtyMap);
  }

  @override
  Widget build(BuildContext context) {
    superPrint(widget.receiveQty, title: "Return Qty");
    ref.listen(returnRequestStateNotifierProvider, (pre, next) {
      if (next is IncrementReturnRequestQty &&
          widget.reasonIndex == next.index) {
        setState(() {
          totalQty = next.qty;
          reasonQtyMap.addAll({widget.reasonIndex: totalQty});
          txtQty.text = reasonQtyMap[next.index].toString();
          sumNewReturnQty = reasonQtyMap.values
              .fold(0, (previousValue, element) => previousValue + element);
        });
      }
      if (next is DecrementReturnRequestQty &&
          widget.reasonIndex == next.index) {
        setState(() {
          totalQty = next.qty;
          reasonQtyMap.addAll({widget.reasonIndex: totalQty});
          txtQty.text = reasonQtyMap[next.index].toString();
          sumNewReturnQty = reasonQtyMap.values
              .fold(0, (previousValue, element) => previousValue + element);
        });
      }

      if (next is AddReturnRequestQtyTextFieldValue &&
          widget.reasonIndex == next.index) {
        setState(() {
          totalQty = next.qty;
          reasonQtyMap.addAll({widget.reasonIndex: totalQty});
          txtQty.text = reasonQtyMap[next.index].toString();
        });
      }
    });

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "How many items is missing",
            size: 11,
          ),
          Row(
            children: [
              addMinusIconButtonWidget(() {
                ref
                    .read(returnRequestStateNotifierProvider.notifier)
                    .decrementTotalQty(widget.reasonIndex, totalQty);
              }, CupertinoIcons.minus_circle_fill, AppColor.primary),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isShowTextField = !isShowTextField;
                    if (isShowTextField) {
                      txtQty.text = reasonQtyMap[widget.reasonIndex].toString();
                    }
                  });
                },
                child: isShowTextField
                    ? Container(
                        height: 40,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                        ),
                        child: TextFormField(
                          controller: txtQty,
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
                              txtQty.text = value;
                              ref
                                  .read(returnRequestStateNotifierProvider
                                      .notifier)
                                  .addQtyTextFieldValue(widget.reasonIndex,
                                      double.parse(txtQty.text).toInt());
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
                          reasonQtyMap[widget.reasonIndex].toString(),
                          size: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(width: 5),
              addMinusIconButtonWidget(() {
                setState(() {
                  sumNewReturnQty = reasonQtyMap.values.fold(
                      0, (previousValue, element) => previousValue + element);
                  superPrint(sumNewReturnQty);
                });
                ref
                    .read(returnRequestStateNotifierProvider.notifier)
                    .incrementNewReturnTotalQty(
                        widget.reasonIndex, totalQty, sumNewReturnQty);

                superPrint(reasonQtyMap.values);
              }, CupertinoIcons.add_circled_solid, AppColor.primary),
              const SizedBox(width: 5),
            ],
          ),
          Visibility(
              visible: widget.reasonIndex ==
                  widget.returnRequestReasonList.last.reason,
              child: const SizedBox(height: 10)),
          Visibility(
            visible: widget.reasonIndex ==
                widget.returnRequestReasonList.last.reason,
            child: Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: AppColor.dropshadowColor,
                      blurRadius: 3,
                      spreadRadius: 3),
                ],
              ),
              child: TextField(
                controller: txtNewReturnComment,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Comments ....",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
