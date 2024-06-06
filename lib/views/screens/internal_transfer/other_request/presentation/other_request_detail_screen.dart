import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/state/other_request_state.dart';
import 'package:unidbox_app/views/widgets/load_more_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../my_request/domain/my_request.dart';
import 'widgets/each_other_request_product_widget.dart';

class OtherRequestDetailScreen extends ConsumerStatefulWidget {
  const OtherRequestDetailScreen({super.key});

  @override
  ConsumerState<OtherRequestDetailScreen> createState() =>
      _OtherRequestsDetailScreenState();
}

class _OtherRequestsDetailScreenState
    extends ConsumerState<OtherRequestDetailScreen> {
  List<OtherRequest> otherRequestList = [];
  List<ProductLineId> acceptProductList = [];
  List<ProductLineId> requestProductList = [];
  int offset = 0;
  bool requestLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(otherRequestStateNotifierProvider.notifier).clearMyRequestValue();
    scrollController.addListener(_scrollListener);
    _loadProducts(0);
  }

  void _loadProducts(int offset) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(otherRequestStateNotifierProvider.notifier)
          .getAllOtherRequest(offset);
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
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
          requestLoading = true;
          otherRequestList = [];
          requestProductList.clear();
          acceptProductList.clear();
        });
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          for (var data in otherRequestList) {
            for (var element in data.productLineList) {
              if (element.status == 'progress') {
                acceptProductList.add(element);
              }
              if (element.status == "requested") {
                requestProductList.add(element);
              }
            }
          }
          requestLoading = false;
          superPrint(acceptProductList);
          superPrint(requestProductList);
        });
      }
      if (next is IsDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
    });
    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    if (requestLoading) {
      return Center(
        child: CupertinoActivityIndicator(
          color: AppColor.pinkColor,
        ),
      );
    }
    if (otherRequestList.isEmpty) {
      return Center(
        child: textWidget("No Data !"),
      );
    }
    return Column(
      children: [
        acceptRequestWidget(),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String requestCode = otherRequestList[index].name;
                String name = otherRequestList[index].userId[1];
                //String status = otherRequestList[index].intStatus;
                String currentDate = otherRequestList[index].createDate;
                return eachOtherRequestProductLineWidget(
                  requestCode,
                  name,
                  currentDate,
                  requestProductList,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: otherRequestList.length),
        ),
        if (xLoading) loadMoreWidget(),
        Platform.isIOS && xLoading
            ? SizedBox(height: 3.h)
            : const SizedBox.shrink()
      ],
    );
  }

  Widget acceptRequestWidget() {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => PendingRequestListScreen(
        //           pendingRequestList: pendingRequestList,
        //         )));
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
                    "Accepted List",
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
              visible: acceptProductList.isNotEmpty,
              child: Positioned(
                top: -15,
                right: -10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.pinkColor,
                  child: textWidget(
                    acceptProductList.length.toString(),
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
