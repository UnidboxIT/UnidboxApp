import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import 'my_requests_detail_screen.dart';
import 'widgets/my_request_search_widget.dart';

class MyRequestScreen extends StatefulWidget {
  const MyRequestScreen({super.key});

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {
  List<String> requestList = ["My\nRequests", "Requests\nHistory"];
  String selectedRequest = "My\nRequests";
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0x00f6f6f6),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Internal Transfer",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: orderReceivingBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderReceivingBodyWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const MyRequestSearchWidget(),
          requestHistoryWidget(),
          pendingRequestWidget(),
          const Expanded(child: MyRequestsDetailScreen()),
        ],
      ),
    );
  }

  Widget requestHistoryWidget() {
    return Container(
      height: 8.h,
      width: 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedRequest = requestList[index];
                });
              },
              child: Container(
                width: 42.w,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                decoration: BoxDecoration(
                  color: selectedRequest == requestList[index]
                      ? AppColor.pinkColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.dropshadowColor,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0, 3))
                  ],
                ),
                child: textWidget(
                  requestList[index],
                  color: selectedRequest == requestList[index]
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  maxLine: 2,
                  size: 15,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
          itemCount: requestList.length),
    );
  }

  Widget pendingRequestWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100.w,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppColor.bottomSheetBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget("Internal Transfer Pending Request",
                    size: 13, fontWeight: FontWeight.bold),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
              ],
            ),
          ),
          Positioned(
            top: -15,
            right: -10,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.pinkColor,
              child: textWidget(
                "3",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
