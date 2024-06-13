import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../domain/my_request.dart';
import 'widgets/each_product_line_widget.dart';
import 'widgets/search_pending_request_widget.dart';

class PendingRequestListScreen extends ConsumerStatefulWidget {
  final List<MyRequest> pendingRequestList;
  const PendingRequestListScreen({super.key, required this.pendingRequestList});

  @override
  ConsumerState<PendingRequestListScreen> createState() =>
      _PendingRequestListScreenState();
}

class _PendingRequestListScreenState
    extends ConsumerState<PendingRequestListScreen> {
  @override
  Widget build(BuildContext context) {
    superPrint(widget.pendingRequestList);
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
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchPendingRequestWidget(),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String requestCode = widget.pendingRequestList[index].name;
                  String name = widget.pendingRequestList[index].userId[1];
                  List<ProductLineId> productList = widget
                      .pendingRequestList[index].productLineList
                      .where((productLine) {
                    return productLine.status == 'requested';
                  }).toList();
                  String currentDate =
                      widget.pendingRequestList[index].createDate;
                  String requestWarehouse =
                      widget.pendingRequestList[index].requestToWh.isEmpty
                          ? ""
                          : widget.pendingRequestList[index].requestToWh[1];
                  if (productList.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      eachProductLineWidget(requestCode, name, currentDate,
                          requestWarehouse, productList),
                      const SizedBox(height: 20)
                    ],
                  );
                },
                itemCount: widget.pendingRequestList.length),
          ),
        ],
      ),
    );
  }
}
