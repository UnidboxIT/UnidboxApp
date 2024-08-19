import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/home/domain/my_task.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/inventory_tracker_screen.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../internal_transfer/internal_transfer/presentation/internal_transfer_screen.dart';
import '../../../internal_transfer/my_request/domain/my_request.dart';
import '../../../internal_transfer/my_return/repository/provider/my_return_provider.dart';
import '../../../internal_transfer/my_return/repository/state/my_return_state.dart';
import '../../../internal_transfer/outlet_request/domain/other_request.dart';
import '../../../internal_transfer/outlet_request/repository/provider/other_request_provider.dart';
import '../../../internal_transfer/outlet_request/repository/state/other_request_state.dart';
import '../../../internal_transfer/outlet_return/repository/provider/outlet_return_provider.dart';
import '../../../internal_transfer/outlet_return/repository/state/outlet_return_state.dart';
import '../../../order_receiving/presentation/order_receiving_screen.dart';

class MyTaskDetailScreen extends ConsumerStatefulWidget {
  final String name;
  final String parentID;
  final List<MyTask> myTaskDetail;
  final Map<int, List<MyTask>> myTaskDetailMap;
  const MyTaskDetailScreen({
    super.key,
    required this.parentID,
    required this.name,
    required this.myTaskDetail,
    required this.myTaskDetailMap,
  });

  @override
  ConsumerState<MyTaskDetailScreen> createState() => _MyTaskDetailScreenState();
}

class _MyTaskDetailScreenState extends ConsumerState<MyTaskDetailScreen> {
  List<OtherRequest> otherRequestList = [];
  List<MyRequest> myRequestList = [];
  List<OtherRequest> outletReturnList = [];
  List<ProductLineId> requestProductList = [];
  List<ProductLineId> outletReturnProductList = [];
  bool isLoading = false;
  int totalInternalTransferLength = 0;
  List<MyRequest> myReturnList = [];
  List<ProductLineId> myReturnProductList = [];
  bool isMyReturnLoading = false;
  bool isOutletReturnLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(otherRequestStateNotifierProvider.notifier).getAllOtherRequest();
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myReturnStateNotifierProvider.notifier).getAllMyReturn();
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(outletReturnStateNotifier.notifier).getAlloutletReturn();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
          isLoading = true;
          otherRequestList = [];
          requestProductList.clear();
        });
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          for (var data in otherRequestList) {
            for (var element in data.productLineList) {
              if (element.status == "requested") {
                requestProductList.add(element);
              }
            }
          }
          isLoading = false;
        });
      }
    });

    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnLoading) {
        setState(() {
          isMyReturnLoading = true;
          myReturnList = [];
          myReturnProductList.clear();
        });
      }
      if (next is MyReturnDataList) {
        setState(() {
          myReturnList = next.myReturnDataList;
          for (var data in myReturnList) {
            for (var element in data.productLineList) {
              if (element.status == "returned") {
                myReturnProductList.add(element);
              }
            }
          }
          isMyReturnLoading = false;
        });
      }
    });
    ref.listen(outletReturnStateNotifier, (pre, next) {
      if (next is OutletReturnLoading) {
        setState(() {
          isOutletReturnLoading = true;
          outletReturnList = [];
          outletReturnProductList.clear();
        });
      }
      if (next is OutletReturnList) {
        setState(() {
          outletReturnList = next.outletReturnList;
          for (var data in outletReturnList) {
            for (var element in data.productLineList) {
              if (element.status == "returned") {
                outletReturnProductList.add(element);
              }
            }
          }
          isOutletReturnLoading = false;
        });
      }
    });
    setState(() {
      if (!isLoading && !isMyReturnLoading && !isOutletReturnLoading) {
        totalInternalTransferLength = requestProductList.length +
            outletReturnProductList.length +
            myReturnProductList.length;
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(widget.name, () {
                Navigator.of(context).pop();
              }),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: mytaskDetailBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mytaskDetailBodyWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4.h),
      child: detailListViewWidget(),
    );
  }

  Widget detailListViewWidget() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.myTaskDetail.length,
        itemBuilder: (context, index) {
          var task = widget.myTaskDetail[index];
          return GestureDetector(
            onTap: () {
              switch (task.name) {
                case "Inventory Tracker":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InventoryTrackerScreen()));
                  break;
                case "Internal Transfer":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InternalTransferScreen(
                            internalTransferList:
                                widget.myTaskDetailMap[task.id] ?? [],
                          )));
                  break;
                case "Order Receiving":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrderReceivingScreen()));
                  break;
              }
            },
            child: eachMyTaskDetailWidget(
              task.imageUrl,
              task.name,
              index,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 2.5.h);
        });
  }

  Widget eachMyTaskDetailWidget(String image, String name, int count) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 18.h,
          width: 100.w,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColor.dropshadowColor,
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: const Offset(-3, 3)),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(
                imageUrl: image,
                width: 40.w,
                height: 14.h,
              ),
              SizedBox(
                width: 30.w,
                child: textWidget(name,
                    size: 18,
                    maxLine: 2,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        ),
        totalInternalTransferLength == 0 || count == 0 || count == 1
            ? const SizedBox.shrink()
            : Positioned(
                top: -10,
                right: -5,
                child: CircleAvatar(
                  backgroundColor: AppColor.pinkColor,
                  radius: 19,
                  child: textWidget(
                    count == 2 ? totalInternalTransferLength.toString() : '0',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 13,
                  ),
                ),
              ),
      ],
    );
  }
}
