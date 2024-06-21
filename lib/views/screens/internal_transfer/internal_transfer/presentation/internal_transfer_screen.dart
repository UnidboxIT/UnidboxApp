import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import '../../../../user_warehouse_service/domain/user_warehouse.dart';
import '../../../../user_warehouse_service/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse_service/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../../bottom_nav/presentation/bottom_nav_bar.dart';
import '../../../bottom_nav/repository/bottom_nav_state_notifier.dart';
import '../../../home/domain/my_task.dart';
import '../../my_request/domain/my_request.dart';
import '../../my_request/presentation/my_requests_detail_screen.dart';
import '../../outlet_request/domain/other_request.dart';
import '../../outlet_request/presentation/other_request_detail_screen.dart';
import '../../outlet_request/repository/provider/other_request_provider.dart';
import '../../outlet_request/repository/state/other_request_state.dart';
import '../../outlet_return/presentation/outlet_return_screen.dart';

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
  List<OtherRequest> myRequestList = [];
  List<ProductLineId> requestProductList = [];
  List<ProductLineId> outletReturnProductList = [];
  bool isLoading = false;
  bool isWarehouseLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ref.read(otherRequestStateNotifierProvider.notifier).clearMyRequestValue();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(otherRequestStateNotifierProvider.notifier).getAllOtherRequest();
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userWarehouseStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          isWarehouseLoading = true;
        });
      }
      if (next is UserWarehouseData) {
        setState(() {
          userWarehouse = next.warehouse;
          isWarehouseLoading = false;
        });
      }
    });
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
          isLoading = true;
          otherRequestList = [];
          requestProductList.clear();
          outletReturnProductList.clear();
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
              if (element.status == "returned") {
                outletReturnProductList.add(element);
              }
            }
          }
          isLoading = false;
        });
      }
    });

    final currentIndex = ref.watch(bottomNavNotifierControllerProvider);
    final bottomNavNotifier =
        ref.watch(bottomNavNotifierControllerProvider.notifier);
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
        floatingActionButton: floatingActionBottomWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavBarWidget(
            currentIndex, bottomNavNotifier, ref, context,
            needControl: true),
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
                        builder: (context) => const MyRequestsDetailScreen()));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtherRequestDetailScreen(
                              userWarehouse: userWarehouse,
                            )));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OutletReturnScreen(
                              userWarehouse: userWarehouse,
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
              return SizedBox(height: 2.5.h);
            },
            itemCount: widget.internalTransferList.length));
  }

  Widget eachInternalTransferWidget(String image, String name, int count) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 20.h,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              const SizedBox(width: 10),
              SizedBox(
                width: 23.w,
                child: textWidget(name, size: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        isLoading
            ? Container()
            : Visibility(
                visible: count == 1 && requestProductList.isNotEmpty,
                child: Positioned(
                  top: -10,
                  right: -5,
                  child: CircleAvatar(
                    backgroundColor: AppColor.pinkColor,
                    radius: 19,
                    child: textWidget(
                      requestProductList.length.toString(),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 13,
                    ),
                  ),
                ),
              ),
        isLoading
            ? Container()
            : Visibility(
                visible: count == 2 && outletReturnProductList.isNotEmpty,
                child: Positioned(
                  top: -10,
                  right: -5,
                  child: CircleAvatar(
                    backgroundColor: AppColor.pinkColor,
                    radius: 19,
                    child: textWidget(
                      outletReturnProductList.length.toString(),
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
