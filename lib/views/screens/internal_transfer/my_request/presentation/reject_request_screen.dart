import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../domain/my_request.dart';
import '../repository/provider/my_request_provider.dart';
import '../repository/state/my_request_state.dart';
import 'widgets/filter_by_date_widget.dart';
import 'widgets/search_pending_request_widget.dart';

class RejectRequestScreen extends ConsumerStatefulWidget {
  const RejectRequestScreen({super.key});

  @override
  ConsumerState<RejectRequestScreen> createState() => _RejectListScreenState();
}

class _RejectListScreenState extends ConsumerState<RejectRequestScreen> {
  List<MyRequest> rejectRequestList = [];
  int acceptProductID = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestList) {
        rejectRequestList = [];
        setState(() {
          rejectRequestList = next.myRequestList;
          acceptProductID = -1;
        });
      }
      if (next is ReceivedProductID) {
        setState(() {
          acceptProductID = next.productID;
        });
      }
      if (next is Error) {
        setState(() {
          acceptProductID = -1;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Rejected Request",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: rejectedRequestWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rejectedRequestWidget() {
    return Container(
      width: 100.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          filterByDateWidget(),
          const SearchRejectRequestWidget(),
          rejectedRequestListWidget(),
        ],
      ),
    );
  }

  Widget rejectedRequestListWidget() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // String requestCode = rejectRequestList[index].name;
        // String name = rejectRequestList[index].userId[1];
        // String currentDate = rejectRequestList[index].createDate;
        List<ProductLineId> productList =
            rejectRequestList[index].productLineList.where((productLine) {
          return productLine.removeReject;
        }).toList();

        String requestWarehouse = rejectRequestList[index].requestToWh.isEmpty
            ? ""
            : rejectRequestList[index].requestToWh[1];
        if (productList.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          children: [
            eachProductLineWidget(requestWarehouse, productList),
            const SizedBox(height: 20)
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: rejectRequestList.length,
    );
  }

  Widget eachProductLineWidget(
      String requestWh, List<ProductLineId> productList) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: productList.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 5.h);
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                        )
                      ]),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      textWidget(
                          "$requestWh unable to fulfilled all your request",
                          color: AppColor.primary,
                          size: 11.5,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 1,
                              offset: const Offset(0, 0))
                        ]),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
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
                                image: productList[index].imageUrl != "false"
                                    ? NetworkImage(productList[index].imageUrl)
                                    : const AssetImage(
                                        'assets/images/app_icon.jpeg'),
                                fit: BoxFit.cover),
                          ),
                          height: 13.h,
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
                                  textOverflow: TextOverflow.fade,
                                  textAlign: TextAlign.left),
                              textWidget(productList[index].code,
                                  size: 12,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                              textWidget(
                                productList[index].model == "false"
                                    ? ""
                                    : productList[index].model,
                                fontWeight: FontWeight.w500,
                                size: 13,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
