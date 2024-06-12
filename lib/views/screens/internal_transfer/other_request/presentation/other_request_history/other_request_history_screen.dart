import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/app_bar/global_app_bar.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/presentation/widgets/search_pending_request_widget.dart';
import 'each_history_widget.dart';

class OtherRequestHistoryScreen extends StatefulWidget {
  final List<OtherRequest> otherRequestList;
  const OtherRequestHistoryScreen({super.key, required this.otherRequestList});

  @override
  State<OtherRequestHistoryScreen> createState() =>
      _PendingRequestListScreenState();
}

class _PendingRequestListScreenState extends State<OtherRequestHistoryScreen> {
  @override
  Widget build(BuildContext context) {
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
                "Transfered History",
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
                  String requestCode = widget.otherRequestList[index].name;
                  String name = widget.otherRequestList[index].userId[1];
                  List<ProductLineId> productList = widget
                      .otherRequestList[index].productLineList
                      .where((productLine) {
                    return productLine.status == 'done';
                  }).toList();
                  String currentDate =
                      widget.otherRequestList[index].createDate;
                  if (productList.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      eachHistoryWidget(
                          requestCode, name, currentDate, productList),
                      const SizedBox(height: 20)
                    ],
                  );
                },
                itemCount: widget.otherRequestList.length),
          ),
        ],
      ),
    );
  }
}
