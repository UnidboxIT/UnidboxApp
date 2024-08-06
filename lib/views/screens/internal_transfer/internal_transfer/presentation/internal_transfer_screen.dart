import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_return/repository/provider/outlet_return_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_return/repository/state/outlet_return_state.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../../home/domain/my_task.dart';
import '../../my_request/domain/my_request.dart';
import '../../my_request/presentation/my_requests_detail_screen.dart';
import '../../my_request/presentation/widgets/drawer_widget.dart';
import '../../my_return/presentation/my_return_screen.dart';
import '../../my_return/repository/provider/my_return_provider.dart';
import '../../my_return/repository/state/my_return_state.dart';
import '../../outlet_request/domain/other_request.dart';
import '../../outlet_request/presentation/other_request_detail_screen.dart';
import '../../outlet_request/repository/provider/other_request_provider.dart';
import '../../outlet_request/repository/state/other_request_state.dart';
import '../../outlet_return/presentation/outlet_return_screen.dart';

class InternalTransferScreen extends ConsumerStatefulWidget {
  final List<MyTask> internalTransferList;
  const InternalTransferScreen({
    super.key,
    required this.internalTransferList,
  });

  @override
  ConsumerState<InternalTransferScreen> createState() =>
      _InternalTransferScreenState();
}

class _InternalTransferScreenState
    extends ConsumerState<InternalTransferScreen> {
  GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: UniqueKey().toString());
  bool isWarehouseLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();
  List<OtherRequest> otherRequestList = [];
  List<MyRequest> myReturnList = [];
  List<OtherRequest> outletReturnList = [];
  List<ProductLineId> requestProductList = [];
  List<ProductLineId> outletReturnProductList = [];
  List<ProductLineId> myReturnProductList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
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
            }
          }
          isLoading = false;
        });
      }
    });

    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnLoading) {
        setState(() {
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
        });
      }
    });
    ref.listen(outletReturnStateNotifier, (pre, next) {
      if (next is OutletReturnLoading) {
        setState(() {
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
        });
      }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        endDrawer:
            draweWidget(context, scaffoldKey, ref, isInternalTransfer: true),
        drawerScrimColor: Colors.transparent,
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
              Positioned(
                right: 5.w,
                top: 6.5.h,
                child: GestureDetector(
                  onTap: () {
                    if (scaffoldKey.currentState!.isDrawerOpen) {
                      scaffoldKey.currentState!.closeEndDrawer();
                    } else {
                      scaffoldKey.currentState!.openEndDrawer();
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
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
        padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
        child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyRequestsDetailScreen(
                              isStockRequest: false,
                            )));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const OtherRequestDetailScreen()));
                  } else if (index == 2) {
                    superPrint("MY RETURN >>>>>");
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => const MyReturnScreen()))
                        .then((_) {
                      Future.delayed(const Duration(milliseconds: 10), () {
                        ref
                            .read(myReturnStateNotifierProvider.notifier)
                            .getAllMyReturn();
                      });
                    });
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => const OutletReturnScreen()))
                        .then((_) {
                      Future.delayed(const Duration(milliseconds: 10), () {
                        ref
                            .read(outletReturnStateNotifier.notifier)
                            .getAlloutletReturn();
                      });
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: eachInternalTransferWidget(
                    widget.internalTransferList[index].imageUrl,
                    widget.internalTransferList[index].name,
                    index,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 2.h);
            },
            itemCount: widget.internalTransferList.length));
  }

  Widget eachInternalTransferWidget(String image, String name, int count) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 18.h,
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
              CachedNetworkImage(
                imageUrl: image,
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
        Visibility(
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
        Visibility(
          visible: count == 2 && myReturnProductList.isNotEmpty,
          child: Positioned(
            top: -10,
            right: -5,
            child: CircleAvatar(
              backgroundColor: AppColor.pinkColor,
              radius: 19,
              child: textWidget(
                myReturnProductList.length.toString(),
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 13,
              ),
            ),
          ),
        ),
        Visibility(
          visible: count == 3 && outletReturnProductList.isNotEmpty,
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
