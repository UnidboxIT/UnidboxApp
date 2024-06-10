import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';
import '../../../../widgets/load_more_widget.dart';
import '../repository/provider/my_request_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import 'pending_request_list_screen.dart';
import 'widgets/each_product_line_widget.dart';
import 'widgets/my_request_search_widget.dart';

class MyRequestsDetailScreen extends ConsumerStatefulWidget {
  const MyRequestsDetailScreen({super.key});

  @override
  ConsumerState<MyRequestsDetailScreen> createState() =>
      _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState
    extends ConsumerState<MyRequestsDetailScreen> {
  List<MyRequest> myRequestList = [];
  List<ProductLineId> pendingRequestList = [];
  int offset = 0;
  bool requestLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(myRequestStateNotifierProvider.notifier).clearMyRequestValue();
    scrollController.addListener(_scrollListener);
    _loadProducts(0);
  }

  void _loadProducts(int offset) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest(offset);
    });
  }

  void _scrollListener() async {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        !xLoading) {
      if (isDataExist) {
        setState(() {
          xLoading = true;
        });
        offset += 10;
        superPrint("HERE $offset");
        _loadProducts(offset);
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          xLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestLoading) {
        setState(() {
          pendingRequestList.clear();
          requestLoading = true;
          myRequestList = [];
        });
      }
      if (next is MyRequestList) {
        setState(() {
          myRequestList = next.myRequestList;
          for (var data in myRequestList) {
            for (var element in data.productLineList) {
              if (element.status == 'action') {
                pendingRequestList.add(element);
              }
            }
          }
          requestLoading = false;
        });
      }

      if (next is IsDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
    });
    return Column(
      children: [
        MyRequestSearchWidget(myRequestList: myRequestList),
        Expanded(child: myrequestDetailWidget()),
      ],
    );
  }

  Widget myrequestDetailWidget() {
    if (requestLoading) {
      return Center(
        child: CupertinoActivityIndicator(
          color: AppColor.pinkColor,
        ),
      );
    }
    if (myRequestList.isEmpty) {
      return Center(
        child: textWidget("No Data !"),
      );
    }
    return Column(
      children: [
        pendingRequestWidget(),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String requestCode = myRequestList[index].name;
                String name = myRequestList[index].userId[1];
                //String status = myRequestList[index].intStatus;
                List<ProductLineId> productList =
                    myRequestList[index].productLineList;
                String currentDate = myRequestList[index].createDate;
                String requestWarehouse =
                    myRequestList[index].requestToWh.isEmpty
                        ? ""
                        : myRequestList[index].requestToWh[1];
                return eachProductLineWidget(requestCode, name, currentDate,
                    requestWarehouse, productList);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: myRequestList.length),
        ),
        if (xLoading) loadMoreWidget(),
        Platform.isIOS && xLoading
            ? SizedBox(height: 3.h)
            : const SizedBox.shrink()
      ],
    );
  }

  Widget pendingRequestWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PendingRequestListScreen(
                  pendingRequestList: myRequestList,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                  textWidget(
                    "Pending Request",
                    size: 14,
                    fontWeight: FontWeight.bold,
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
