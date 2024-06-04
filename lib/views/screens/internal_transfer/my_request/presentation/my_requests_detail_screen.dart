import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import '../repository/provider/my_request_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class MyRequestsDetailScreen extends ConsumerStatefulWidget {
  const MyRequestsDetailScreen({super.key});

  @override
  ConsumerState<MyRequestsDetailScreen> createState() =>
      _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState
    extends ConsumerState<MyRequestsDetailScreen> {
  List<MyRequest> myRequestList = [];
  List<MyRequest> interTransferRequestList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestLoading) {
        myRequestList = [];
      }
      if (next is MyRequestList) {
        setState(() {
          myRequestList = next.myRequestList;
          for (var data in myRequestList) {
            if (data.intStatus == 'action') {
              interTransferRequestList.add(data);
            }
          }
        });
      }
    });
    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 20),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String requestCode = myRequestList[index].name;
          String name = myRequestList[index].userId[1];
          String requestFrom = myRequestList[index].requestFromWh[1];
          String status = myRequestList[index].intStatus;
          List<ProductLineId> productList =
              myRequestList[index].productLineList;
          String currentDate = myRequestList[index].createDate;
          return eachProductLineWidget(
              requestCode, name, requestFrom, status, currentDate, productList);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: myRequestList.length);
  }

  Widget eachProductLineWidget(
    String requestCode,
    String name,
    String requestFrom,
    String status,
    String currentDate,
    List<ProductLineId> productList,
  ) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.dropshadowColor,
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        requestCode,
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                      textWidget(
                          DateFormat('dd MMM yyyy').format(
                            DateTime.parse(currentDate),
                          ),
                          color: AppColor.pinkColor,
                          fontWeight: FontWeight.bold,
                          size: 15)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
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
                          image: const DecorationImage(
                              image: AssetImage('assets/images/app_icon.jpeg'),
                              // productList[index].image != "false"
                              //     ? NetworkImage(image)
                              //     :
                              fit: BoxFit.cover),
                        ),
                        height: 12.h,
                        width: 22.w,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget(productList[index].productIdList[1],
                                size: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                maxLine: 2,
                                textOverflow: TextOverflow.fade,
                                textAlign: TextAlign.left),
                            textWidget(productList[index].code,
                                size: 12,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                            textWidget(
                              "RHW-2388",
                              fontWeight: FontWeight.w500,
                              size: 13,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                addMinusIconButtonWidget(
                                  CupertinoIcons.minus_circle_fill,
                                ),
                                const SizedBox(width: 10),
                                textWidget(productList[index].qty.toString(),
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold,
                                    size: 13),
                                const SizedBox(width: 10),
                                addMinusIconButtonWidget(
                                  CupertinoIcons.add_circled_solid,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Request from",
                            color: AppColor.orangeColor,
                            size: 12.5,
                          ),
                          textWidget(
                            requestFrom,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 14,
                          ),
                          textWidget(
                            name,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 14,
                          )
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Status",
                            color: AppColor.orangeColor,
                            size: 12.5,
                          ),
                          textWidget(
                            capitalizeFirstLetter(status),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                  Visibility(
                      visible: status == 'issued',
                      child: const SizedBox(height: 10)),
                  Visibility(
                    visible: status == 'issued',
                    child: SizedBox(
                      width: 80.w,
                      child: buttonWidget(
                        "Received",
                        () {},
                        elevation: 0,
                        bgColor: AppColor.pinkColor,
                        fontColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: productList.length);
  }

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word; // Return empty string if input is empty
    }
    return word[0].toUpperCase() + word.substring(1);
  }

  Widget addMinusIconButtonWidget(IconData iconData) {
    return Icon(
      iconData,
      color: AppColor.pinkColor,
      size: 18,
    );
  }
}
