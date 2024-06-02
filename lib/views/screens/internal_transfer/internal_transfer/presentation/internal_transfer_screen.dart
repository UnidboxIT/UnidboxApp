import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/internal_transfer/domain/internal_transfer.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/presentation/other_request_screen.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../my_request/presentation/my_request_screen.dart';

class InternalTransferScreen extends StatefulWidget {
  const InternalTransferScreen({super.key});

  @override
  State<InternalTransferScreen> createState() => _InternalTransferScreenState();
}

class _InternalTransferScreenState extends State<InternalTransferScreen> {
  List<InternalTransfer> internalTransferList = [
    InternalTransfer(
        id: 1, image: "assets/images/app_icon.jpeg", name: "My Requests"),
    InternalTransfer(
        id: 1, image: "assets/images/app_icon.jpeg", name: "Other Requests"),
  ];
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4.h),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyRequestScreen()));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OtherRequestScreen()));
                  }
                },
                child: eachInternalTransferWidget(
                  internalTransferList[index].image,
                  internalTransferList[index].name,
                  index,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 30);
            },
            itemCount: internalTransferList.length));
  }

  Widget eachInternalTransferWidget(String image, String name, int count) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.dropshadowColor,
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ]),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 50.w,
                height: 16.h,
              ),
              SizedBox(
                width: 23.w,
                child: textWidget(name, size: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Visibility(
          visible: count != 0,
          child: Positioned(
            top: -10,
            right: -5,
            child: CircleAvatar(
              backgroundColor: AppColor.pinkColor,
              radius: 19,
              child: textWidget(
                "3",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
