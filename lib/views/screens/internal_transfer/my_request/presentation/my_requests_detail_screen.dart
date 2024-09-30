import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/presentation/widgets/drawer_widget.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../domain/filter_product_status.dart';
import '../domain/my_request.dart';
import '../repository/provider/my_request_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../repository/state/my_request_state.dart';
import 'pending_request_list_screen.dart';
import 'request_history_screen.dart';
import 'widgets/each_product_line_widget.dart';
import 'widgets/my_request_search_widget.dart';
import 'widgets/rejected_product_widget.dart';

int selectedFilterIndex = 3;

class MyRequestsDetailScreen extends ConsumerStatefulWidget {
  final bool isStockRequest;
  const MyRequestsDetailScreen({super.key, required this.isStockRequest});

  @override
  ConsumerState<MyRequestsDetailScreen> createState() =>
      _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState
    extends ConsumerState<MyRequestsDetailScreen> {
  GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: UniqueKey().toString());
  List<MyRequest> myRequestList = [];
  List<ProductLineId> pendingRequestList = [];
  List<ProductLineId> rejectedList = [];
  int acceptProductID = -1;
  bool receivedLoading = false;
  bool myRequestLoading = false;
  bool isMyRequestDataLoading = false;
  // bool requestLoading = false;
  List<String> visibleCode = [];
  List<FilterProductStatus> filterProductStatusList = [
    FilterProductStatus(id: 1, name: "Accepted"),
    //FilterProductStatus(id: 2, name: "Packed"),
    FilterProductStatus(id: 2, name: "On-Delivery"),
    FilterProductStatus(id: 3, name: "Receiving"),
  ];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest();
    });
  }

  loadSetVisiblity(String code) {
    setState(() {
      visibleCode.add(code);
    });
  }

  removeVisiblity(String code) {
    setState(() {
      visibleCode.remove(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(currentRouteProvider.notifier).state = '/myRequest';
    });
    ref.watch(myRequestStateNotifierProvider);
    superPrint(ref.read(currentRouteProvider.notifier).state);
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestList) {
        setState(() {
          myRequestList = [];
          pendingRequestList.clear();
          rejectedList.clear();
          myRequestList = next.myRequestList;
          for (var data in myRequestList) {
            for (var element in data.productLineList) {
              if (element.status == 'requested') {
                pendingRequestList.add(element);
              }
              if (element.status == "rejected" && element.rejectedQty > 0 ||
                  (element.status != "requested" &&
                      element.qty > element.issueQty &&
                      element.rejectedQty > 0)) {
                rejectedList.add(element);
              }
            }
          }
          isMyRequestDataLoading = false;
          myRequestLoading = false;
          //requestLoading = false;
        });
      }
      if (next is MyRequestDataListLoading) {
        setState(() {
          isMyRequestDataLoading = true;
        });
      }

      if (next is ReceiveLoading) {
        setState(() {
          receivedLoading = true;
        });
      }

      if (next is ReceivedProductID) {
        setState(() {
          acceptProductID = next.productID;
        });
      }
      if (next is MyRequestLoading) {
        setState(() {
          myRequestLoading = true;
        });
      }

      if (next is MyRequestError) {
        setState(() {
          myRequestLoading = false;
        });
      }

      if (next is Error) {
        setState(() {
          myRequestLoading = false;
          receivedLoading = false;
        });
      }
      if (next is SearchMyRequestList) {
        setState(() {
          myRequestList = [];
          pendingRequestList.clear();
          myRequestList = next.searchMyRequestList;
        });
      }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffF6F6F6),
        endDrawer: draweWidget(context, scaffoldKey, ref),
        drawerScrimColor: Colors.transparent,
        body: PopScope(
          onPopInvoked: (_) =>
              ref.read(currentRouteProvider.notifier).state = '/',
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "My Requests",
                  () {
                    ref.read(currentRouteProvider.notifier).state = '/';
                    Navigator.of(context).pop();
                  },
                ),
                Positioned(
                  right: 5.w,
                  top: 6.5.h,
                  child: Row(
                    children: [
                      GestureDetector(
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
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          ref.read(bottomBarVisibilityProvider.notifier).state =
                              false;
                          ref.read(currentRouteProvider.notifier).state = '/';
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const RequestHistoryScreen()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: const Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }

  Widget orderReceivingBodyWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          MyRequestSearchWidget(myRequestList: myRequestList),
          Expanded(
            child: isMyRequestDataLoading
                ? Center(
                    child: CupertinoActivityIndicator(
                      color: AppColor.primary,
                    ),
                  )
                : myrequestDetailWidget(),
          ),
          Container(
            height: 5.h,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }

  Widget myrequestDetailWidget() {
    // if (requestLoading) {
    //   return Center(
    //     child: CupertinoActivityIndicator(
    //       color: AppColor.pinkColor,
    //     ),
    //   );
    // }
    // if (myRequestList.isEmpty) {
    //   return Center(
    //     child: textWidget("No Data !"),
    //   );
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rejectedProductWidget(rejectedList, context, ref),
            pendingRequestWidget(),
          ],
        ),
        const SizedBox(height: 10),
        filterProductByStatusWidget(),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String requestCode = myRequestList[index].name;

                String name = myRequestList[index].userId[1];
                List<ProductLineId> productList = selectedFilterIndex == 2 ||
                        selectedFilterIndex == 3
                    ? myRequestList[index]
                        .productLineList
                        .where((productLine) => productLine.status == "issued")
                        .toList()
                    :
                    // selectedFilterIndex == 2
                    //     ? myRequestList[index]
                    //         .productLineList
                    //         .where(
                    //             (productLine) => productLine.status == "packed")
                    //         .toList()
                    //     :
                    myRequestList[index]
                        .productLineList
                        .where((productLine) => productLine.status == "accepted"
                            // ||
                            // productLine.status == "waiting_return_accept"
                            )
                        .toList();

                String currentDate = myRequestList[index].createDate;
                String requestWarehouse =
                    myRequestList[index].requestToWh.isEmpty
                        ? ""
                        : myRequestList[index].requestToWh[1];
                if (productList.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.dropshadowColor.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (visibleCode.contains(requestCode)) {
                                  removeVisiblity(requestCode);
                                } else {
                                  loadSetVisiblity(requestCode);
                                }
                              },
                              child: Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: AppColor.bottomSheetBgColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.03),
                                          offset: const Offset(0, 3),
                                          blurRadius: 3)
                                    ]),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textWidget(
                                      requestCode,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    textWidget(
                                        DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(currentDate),
                                        ),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        size: 17)
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: visibleCode.contains(requestCode),
                              child: const SizedBox(height: 13),
                            ),
                            Visibility(
                              visible: visibleCode.contains(requestCode),
                              child: eachProductLineWidget(
                                  requestCode,
                                  name,
                                  currentDate,
                                  requestWarehouse,
                                  productList,
                                  myRequestList[index].isUrgentPicking,
                                  isPending: receivedLoading,
                                  myRequestLoading: myRequestLoading,
                                  acceptProductID: acceptProductID),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                );
              },
              itemCount: myRequestList.length),
        ),
        SizedBox(
          height: 4.h,
        )
      ],
    );
  }

  Widget pendingRequestWidget() {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
        ref.read(currentRouteProvider.notifier).state = '/';
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PendingRequestListScreen(),
          ),
        );
      },
      child: Container(
        width: 47.w,
        padding: const EdgeInsets.only(right: 20),
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 100.w,
              height: 8.h,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                color: AppColor.bottomSheetBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20.w,
                    child: textWidget("Pending Request",
                        size: 14,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: pendingRequestList.isNotEmpty,
              child: Positioned(
                top: -15,
                right: -10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.pinkColor,
                  child: textWidget(
                    pendingRequestList.length.toString(),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filterProductByStatusWidget() {
    return Container(
      height: 5.h,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: filterProductStatusList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 5);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilterIndex = filterProductStatusList[index].id;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: filterProductStatusList[index].id == selectedFilterIndex
                    ? AppColor.primary
                    : AppColor.pinkColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: textWidget(
                filterProductStatusList[index].name,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                size: 13,
              ),
            ),
          );
        },
      ),
    );
  }
}
