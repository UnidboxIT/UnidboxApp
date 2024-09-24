import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/outlet_reject_reason.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/outlet_reject_reason_state.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../repository/provider/other_request_provider.dart';
import '../../repository/state/other_request_state.dart';

Future<void> outletRejectBottomSheet(
  int productId,
  double issueQty,
  BuildContext context,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black.withOpacity(0.1),
    barrierColor: Colors.black.withOpacity(0.3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    elevation: 0,
    useSafeArea: true,
    builder: (context) => OutletRejectWidget(
      productId: productId,
      issuedQty: issueQty,
    ),
  );
}

class OutletRejectWidget extends ConsumerStatefulWidget {
  final int productId;
  final double issuedQty;

  const OutletRejectWidget({
    super.key,
    required this.productId,
    required this.issuedQty,
  });

  @override
  ConsumerState<OutletRejectWidget> createState() => _OutletRejectWidgetState();
}

class _OutletRejectWidgetState extends ConsumerState<OutletRejectWidget> {
  ReasonsData selectedRejectReason = ReasonsData(
      id: 0, name: '', newRequest: false, option: '', reject: false);
  TextEditingController txtOtherRemark = TextEditingController();
  bool isOther = false;
  int acceptProductID = -1;
  bool acceptLoading = false;
  List<ReasonsData> outletRejectList = [];

  @override
  void initState() {
    super.initState();
    ref.read(acceptedStateNotifierProvider.notifier).clearOtherRequestMap();
    Future.delayed(const Duration(milliseconds: 10), () async {
      ref
          .read(outletRejectReasonStateNotifierProvider.notifier)
          .getOutletRejectReason();
    });
  }

  updateSelectedUom(values) {
    if (values != null) {
      setState(() {
        selectedRejectReason = values;
        if (selectedRejectReason.name.trim() == "Others") {
          isOther = true;
        } else {
          isOther = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(outletRejectReasonStateNotifierProvider, (pre, next) {
      if (next is RejectLoading) {
        setState(() {
          outletRejectList = [];
        });
      }
      if (next is OutletRejectReasonList) {
        setState(() {
          outletRejectList = next.outletRejectReasonList;
        });
      }
    });
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestList) {
        setState(() {
          acceptLoading = false;
          acceptProductID = -1;
        });
      }
      if (next is AcceptLoading) {
        setState(() {
          acceptLoading = true;
        });
      }
      if (next is AcceptProductID) {
        setState(() {
          acceptProductID = next.productID;
        });
      }
      if (next is Error) {
        setState(() {
          acceptLoading = false;
          acceptProductID = -1;
        });
      }
    });

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
        child: Container(
          width: 100.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: AppColor.bottomSheetBgColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget(
                "Accepted with lesser quantity",
                fontWeight: FontWeight.w700,
                color: AppColor.primary,
                size: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget("Reason", size: 14, color: AppColor.orangeColor),
                  const SizedBox(height: 10),
                  Container(
                    width: 80.w,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<ReasonsData>(
                        isExpanded: true,
                        autofocus: true,
                        isDense: true,
                        dropdownStyleData: DropdownStyleData(
                          width: 80.w,
                          offset: const Offset(-10, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                        hint: Text(
                          'Select Reason',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColor.fontColor.withOpacity(0.6),
                              fontWeight: FontWeight.w500),
                        ),
                        items: outletRejectList
                            .where((e) => e.reject)
                            .map((item) => DropdownMenuItem<ReasonsData>(
                                  value: item,
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedRejectReason.name.isEmpty
                            ? null
                            : selectedRejectReason,
                        onChanged: (value) {
                          updateSelectedUom(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                      visible: isOther,
                      child: textWidget("Remark",
                          size: 14, color: AppColor.orangeColor)),
                  Visibility(
                      visible: isOther, child: const SizedBox(height: 10)),
                  Visibility(
                    visible: isOther,
                    child: Container(
                      width: 80.w,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: txtOtherRemark,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
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
              SizedBox(
                width: 50.w,
                child: buttonWidget("Accept", () {
                  acceptLoading && acceptProductID == widget.productId
                      ? () {}
                      : isOther
                          ? ref
                              .read(otherRequestStateNotifierProvider.notifier)
                              .acceptOtherRequest(
                                  widget.productId,
                                  widget.issuedQty,
                                  selectedRejectReason.id,
                                  txtOtherRemark.text,
                                  context)
                              .then((_) {
                              Navigator.of(context).pop();
                              ref
                                  .read(bottomBarVisibilityProvider.notifier)
                                  .state = true;
                            })
                          : ref
                              .read(otherRequestStateNotifierProvider.notifier)
                              .acceptOtherRequest(
                                  widget.productId,
                                  widget.issuedQty,
                                  selectedRejectReason.id,
                                  "",
                                  context)
                              .then((_) {
                              Navigator.of(context).pop();
                              ref
                                  .read(bottomBarVisibilityProvider.notifier)
                                  .state = true;
                            });
                },
                    isBool:
                        acceptLoading && acceptProductID == widget.productId),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
