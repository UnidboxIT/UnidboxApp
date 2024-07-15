import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
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

class MyRequestsDetailScreen extends ConsumerStatefulWidget {
  final bool isStockRequest;
  const MyRequestsDetailScreen({super.key, required this.isStockRequest});

  @override
  ConsumerState<MyRequestsDetailScreen> createState() =>
      _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState
    extends ConsumerState<MyRequestsDetailScreen> {
  List<MyRequest> myRequestList = [];
  List<ProductLineId> pendingRequestList = [];
  int acceptProductID = -1;
  bool receivedLoading = false;
  bool myRequestLoading = false;
  // bool requestLoading = false;
  List<String> visibleCode = [];
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
    ref.watch(myRequestStateNotifierProvider);
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestList) {
        setState(() {
          myRequestList = [];
          pendingRequestList.clear();
          myRequestList = next.myRequestList;
          for (var data in myRequestList) {
            for (var element in data.productLineList) {
              if (element.status == 'requested') {
                pendingRequestList.add(element);
              }
            }
          }
          //requestLoading = false;
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
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "My Requests",
                () {
                  superPrint(widget.isStockRequest);
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(65.w, 6.h),
                child: GestureDetector(
                  onTap: () {
                    ref.read(bottomBarVisibilityProvider.notifier).state =
                        false;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RequestHistoryScreen()));
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColor.orangeColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: textWidget("Request\nHistory",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          size: 17)),
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
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            MyRequestSearchWidget(myRequestList: myRequestList),
            Expanded(child: myrequestDetailWidget()),
          ],
        ));
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rejectedProductWidget(),
            pendingRequestWidget(),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String requestCode = myRequestList[index].name;
                superPrint(requestCode);
                String name = myRequestList[index].userId[1];
                List<ProductLineId> productList = myRequestList[index]
                    .productLineList
                    .where((productLine) =>
                        productLine.status != 'done' &&
                        productLine.status != 'returned' &&
                        productLine.status != 'requested')
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
                              child: eachProductLineWidget(requestCode, name,
                                  currentDate, requestWarehouse, productList,
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PendingRequestListScreen()));
      },
      child: Container(
        width: 46.w,
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
}
