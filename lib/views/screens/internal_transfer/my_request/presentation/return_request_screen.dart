import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../domain/my_request.dart';
import '../domain/return_request_reason.dart';
import '../repository/provider/my_request_provider.dart';
import '../repository/state/return_request_reason_state.dart';
import '../repository/state/return_request_state.dart';
import 'widgets/each_product_line_widget.dart';

Map<int, int> reasonQtyMap = {};

class ReturnRequestScreen extends ConsumerStatefulWidget {
  final String productCode;
  final String currentDate;
  final String requestWarehouse;
  final ProductLineId productLine;
  final String currentWarehouse;
  final double receiveQty;

  const ReturnRequestScreen({
    super.key,
    required this.productCode,
    required this.currentDate,
    required this.requestWarehouse,
    required this.productLine,
    required this.currentWarehouse,
    required this.receiveQty,
  });

  @override
  ConsumerState<ReturnRequestScreen> createState() =>
      _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends ConsumerState<ReturnRequestScreen> {
  List<ReturnRequestReason> returnRequestReasonList = [];
  List<int> reasonIndex = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(returnRequestReasonStateNotifierProvider.notifier)
          .getOutletRejectReason();
    });
    reasonQtyMap.clear();
  }

  @override
  Widget build(BuildContext context) {
    //superPrint(widget.receiveQty);
    ref.listen(returnRequestReasonStateNotifierProvider, (pre, next) {
      if (next is ReturnReceiveLoading) {
        setState(() {
          returnRequestReasonList = [];
        });
      }
      if (next is ReturnRequestReasonList) {
        setState(() {
          returnRequestReasonList = next.returnRequestReasonList;
        });
      }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Return Request",
                  () {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                  },
                ),
                Transform.translate(
                    offset: Offset(0, 15.h), child: returnRequestWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget returnRequestWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: 100.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColor.bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ]),
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                    widget.productCode,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    size: 20,
                  ),
                  textWidget(
                      DateFormat('dd MMM yyyy').format(
                        DateTime.parse(widget.currentDate),
                      ),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      size: 17)
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.dropshadowColor,
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: widget.productLine.imageUrl != "false"
                          ? NetworkImage(widget.productLine.imageUrl)
                          : const AssetImage('assets/images/app_icon.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 14.5.h,
                  width: 25.w,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: textWidget(widget.productLine.productIdList[1],
                            fontWeight: FontWeight.w700,
                            size: 14,
                            color: Colors.black,
                            textOverflow: TextOverflow.fade,
                            textAlign: TextAlign.left),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: textWidget(widget.productLine.code, size: 13),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: textWidget(
                          "Return To",
                          color: AppColor.orangeColor,
                          size: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 57.w,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.orangeColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: textWidget(widget.requestWarehouse,
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            textWidget(
              "Returned Request By",
              size: 13,
              color: AppColor.orangeColor,
              fontWeight: FontWeight.w500,
            ),
            textWidget(
              widget.currentWarehouse,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            textWidget(
              "Reason",
              size: 13,
              color: AppColor.orangeColor,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            returnReasonWidget(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 80.w,
                height: 43,
                child: buttonWidget(
                  "Submit Return",
                  () {},
                  bgColor: AppColor.primary,
                  fontColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget returnReasonWidget() {
    return Expanded(
      flex: 10,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!reasonIndex
                          .contains(returnRequestReasonList[index].id)) {
                        if (widget.receiveQty > reasonIndex.length) {
                          reasonIndex.add(returnRequestReasonList[index].id);
                        }
                      } else {
                        reasonQtyMap.remove(returnRequestReasonList[index].id);
                        reasonIndex.remove(returnRequestReasonList[index].id);
                      }
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(
                          reasonIndex
                                  .contains(returnRequestReasonList[index].id)
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        textWidget(
                          returnRequestReasonList[index].reason,
                          fontWeight: FontWeight.w700,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      reasonIndex.contains(returnRequestReasonList[index].id),
                  child: EachReturnReasonWidget(
                      reasonIndex: returnRequestReasonList[index].id,
                      reasonIndexList: reasonIndex,
                      returnRequestReasonList: returnRequestReasonList,
                      receiveQty: widget.receiveQty),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: returnRequestReasonList.length),
    );
  }
}

class EachReturnReasonWidget extends ConsumerStatefulWidget {
  final int reasonIndex;
  final List<int> reasonIndexList;
  final List<ReturnRequestReason> returnRequestReasonList;
  final double receiveQty;
  const EachReturnReasonWidget(
      {super.key,
      required this.reasonIndex,
      required this.reasonIndexList,
      required this.returnRequestReasonList,
      required this.receiveQty});

  @override
  ConsumerState<EachReturnReasonWidget> createState() =>
      _EachReturnReasonWidgetState();
}

class _EachReturnReasonWidgetState
    extends ConsumerState<EachReturnReasonWidget> {
  TextEditingController txtQty = TextEditingController();
  bool isShowTextField = false;
  int totalQty = 1;
  TextEditingController txtOtherComment = TextEditingController();
  File imageFile = File("");
  final picker = ImagePicker();
  String base64Image = "";
  bool requestLoading = false;
  int sumRecevieQty = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var data in widget.reasonIndexList) {
      reasonQtyMap.update(data, (value) => value, ifAbsent: () => 1);
      sumRecevieQty = reasonQtyMap.values
          .fold(0, (previousValue, element) => previousValue + element);
    }
    superPrint(sumRecevieQty);
    superPrint(reasonQtyMap);
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      String image64 = await imageToBase64(imageFile);
      setState(() {
        base64Image = image64;
      });
    }
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(returnRequestStateNotifierProvider, (pre, next) {
      if (next is IncrementReturnQty && widget.reasonIndex == next.index) {
        setState(() {
          totalQty = next.qty;
          reasonQtyMap.addAll({widget.reasonIndex: totalQty});
          txtQty.text = reasonQtyMap[next.index].toString();
        });
      }
      if (next is DecrementReturnQty && widget.reasonIndex == next.index) {
        setState(() {
          totalQty = next.qty;
          reasonQtyMap.addAll({widget.reasonIndex: totalQty});
          txtQty.text = reasonQtyMap[next.index].toString();
        });
      }

      if (next is AddQtyTextFieldValue && widget.reasonIndex == next.index) {
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
                ref
                    .read(returnRequestStateNotifierProvider.notifier)
                    .incrementTotalQty(widget.reasonIndex, totalQty);
                setState(() {
                  sumRecevieQty = reasonQtyMap.values.fold(
                      0, (previousValue, element) => previousValue + element);
                  superPrint(sumRecevieQty);
                });

                superPrint(reasonQtyMap.values);
              }, CupertinoIcons.add_circled_solid, AppColor.primary),
              const SizedBox(width: 5),
              //camera
              GestureDetector(
                onTap: () {
                  getImageFromCamera();
                },
                child: Container(
                  width: 10.w,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.pinkColor,
                  ),
                  child: const Icon(
                    Icons.file_present_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 25.w,
                height: 8.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.dropshadowColor,
                          blurRadius: 3,
                          spreadRadius: 3),
                    ]),
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.dropshadowColor,
                            blurRadius: 3,
                            spreadRadius: 3),
                      ]),
                  child: imageFile.path.isEmpty
                      ? const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.grey,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColor.dropshadowColor,
                                    blurRadius: 3,
                                    spreadRadius: 3),
                              ],
                              image: DecorationImage(
                                image: FileImage(
                                  imageFile,
                                ),
                                fit: BoxFit.fill,
                              )),
                        ),
                ),
              )
            ],
          ),
          Visibility(
              visible:
                  widget.reasonIndex == widget.returnRequestReasonList.last.id,
              child: const SizedBox(height: 10)),
          Visibility(
            visible:
                widget.reasonIndex == widget.returnRequestReasonList.last.id,
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
                controller: txtOtherComment,
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
