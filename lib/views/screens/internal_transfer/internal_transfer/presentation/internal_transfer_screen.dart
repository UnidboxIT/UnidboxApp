import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/presentation/other_request_screen.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../../home/domain/my_task.dart';
import '../../my_request/presentation/my_request_screen.dart';
import '../../other_request/domain/other_request.dart';
import '../../other_request/repository/provider/other_request_provider.dart';
import '../../other_request/repository/state/other_request_state.dart';

class InternalTransferScreen extends ConsumerStatefulWidget {
  final List<MyTask> internalTransferList;
  const InternalTransferScreen({super.key, required this.internalTransferList});

  @override
  ConsumerState<InternalTransferScreen> createState() =>
      _InternalTransferScreenState();
}

class _InternalTransferScreenState
    extends ConsumerState<InternalTransferScreen> {
  List<OtherRequest> otherRequestList = [];
  List<OtherRequest> acceptRequestList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(otherRequestStateNotifierProvider.notifier).getAllOtherRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        otherRequestList = [];
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          for (var data in otherRequestList) {
            if (data.intStatus == 'accept') {
              acceptRequestList.add(data);
            }
          }
        });
      }
    });
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
                        builder: (context) => OtherRequestScreen(
                              otherRequestList: otherRequestList,
                              acceptRequestList: acceptRequestList,
                            )));
                  }
                },
                child: eachInternalTransferWidget(
                  widget.internalTransferList[index].imageUrl,
                  widget.internalTransferList[index].name,
                  index,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 30);
            },
            itemCount: widget.internalTransferList.length));
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
              Image.network(
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
          visible: count != 0 && otherRequestList.isNotEmpty,
          child: Positioned(
            top: -10,
            right: -5,
            child: CircleAvatar(
              backgroundColor: AppColor.pinkColor,
              radius: 19,
              child: textWidget(
                otherRequestList.length.toString(),
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
