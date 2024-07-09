import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../domain/my_request.dart';
import '../repository/provider/my_request_provider.dart';
import '../repository/state/my_request_state.dart';
import 'widgets/each_pending_request_list_widget.dart';
import 'widgets/make_new_request_widget.dart';
import 'widgets/search_pending_request_widget.dart';

class PendingRequestListScreen extends ConsumerStatefulWidget {
  const PendingRequestListScreen({
    super.key,
  });

  @override
  ConsumerState<PendingRequestListScreen> createState() =>
      _PendingRequestListScreenState();
}

class _PendingRequestListScreenState
    extends ConsumerState<PendingRequestListScreen> {
  List<MyRequest> pendingRequestList = [];
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
    superPrint("HERE");
    // ref.watch(myRequestStateNotifierProvider);
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestList) {
        pendingRequestList = [];
        setState(() {
          pendingRequestList = next.myRequestList;
        });
      }
      if (next is ReceivedProductID) {
        setState(() {
          acceptProductID = next.productID;
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
                "Pending Requests",
                () {
                  ref
                      .read(requestPendingStateNotifierProvider.notifier)
                      .myRequestPending(false);
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: pendingRequestWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pendingRequestWidget() {
    return Container(
      width: 100.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchPendingRequestWidget(),
          makeNewWidget(context),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String requestCode = pendingRequestList[index].name;
                  String name = pendingRequestList[index].userId[1];
                  List<ProductLineId> productList = pendingRequestList[index]
                      .productLineList
                      .where((productLine) {
                    return productLine.status == 'requested';
                  }).toList();
                  String currentDate = pendingRequestList[index].createDate;
                  String requestWarehouse =
                      pendingRequestList[index].requestToWh.isEmpty
                          ? ""
                          : pendingRequestList[index].requestToWh[1];
                  if (productList.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: [
                      eachPendingRequestListWidget(requestCode, name,
                          currentDate, requestWarehouse, productList,
                          acceptProductID: acceptProductID),
                      const SizedBox(height: 20)
                    ],
                  );
                },
                itemCount: pendingRequestList.length),
          ),
        ],
      ),
    );
  }
}
